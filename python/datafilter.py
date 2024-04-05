import pandas as pd
import json

# Load the Excel file into a DataFrame
df = pd.read_excel('your_excel_file.xlsx')

# Function to parse and filter data based on milliseconds
def filter_data(row):
    try:
        # Parse JSON in the 'your_json_column' column
        json_data = json.loads(row['your_json_column'])
        
        # Extract the 'dt' value
        dt_value = json_data.get('DTSTART', {}).get('dt', '')
        
        # Check if 'dt' contains milliseconds
        if '.' in dt_value:
            return True
        elif ':' in dt_value:
            return False
        else:
            return False  # Adjust this based on your specific criteria
    except json.JSONDecodeError:
        return False  # Handle the case where JSON decoding fails

# Apply the filter function to create two DataFrames
df_with_milliseconds = df[df.apply(filter_data, axis=1)]
df_without_milliseconds = df[~df.apply(filter_data, axis=1)]

# Write the DataFrames to separate Excel sheets
with pd.ExcelWriter('output_excel_file.xlsx') as writer:
    df_with_milliseconds.to_excel(writer, sheet_name='With Milliseconds', index=False)
    df_without_milliseconds.to_excel(writer, sheet_name='Without Milliseconds', index=False)
