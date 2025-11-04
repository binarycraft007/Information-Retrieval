import os
from typing import Optional
from dotenv import load_dotenv
import pymysql
load_dotenv()



conn = pymysql.connect(
    host=os.getenv("DB_HOST", "localhost"),
    port=int(os.getenv("DB_PORT", 3306)),
    user=os.getenv("DB_USER", "root"),
    password=os.getenv("DB_PASSWORD", ""),
    database=os.getenv("DB_NAME", "retail_db"),
    cursorclass=pymysql.cursors.DictCursor,
    autocommit=True
)



def normalize_whitespace(s: Optional[str]) -> Optional[str]:
    if s is None:
        return None
    cleaned = " ".join(s.strip().split())
    if cleaned == "":
        return None
    return cleaned


def to_title_case(s: Optional[str]) -> Optional[str]:
    s = normalize_whitespace(s)
    if s is None:
        return None
    return s.title()



def clean_stores():
    with conn.cursor() as cur:
        cur.execute("SELECT StoreID, StoreName, Location, Contact FROM Stores")
        rows = cur.fetchall()

    updated_count = 0

    for row in rows:
        store_id = row["StoreID"]
        old_name = row["StoreName"]
        old_location = row["Location"]
        old_contact = row["Contact"]

        new_name = to_title_case(old_name)
        new_location = to_title_case(old_location)
        new_contact = normalize_whitespace(old_contact)

        if (new_name != old_name) or (new_location != old_location) or (new_contact != old_contact):
            with conn.cursor() as cur:
                cur.execute(
                    """
                    UPDATE Stores
                    SET StoreName = %s,
                        Location = %s,
                        Contact = %s
                    WHERE StoreID = %s
                    """,
                    (new_name, new_location, new_contact, store_id)
                )
                updated_count += 1

    print(f"{updated_count} rows cleaned in Stores table.")


if __name__ == "__main__":
    clean_stores()
    print("Data cleaning completed successfully.")
