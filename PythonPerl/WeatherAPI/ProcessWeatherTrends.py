import csv

with open("weather_report.csv", "r") as csvfile:
    reader = csv.reader(csvfile)

    # Average values across all locations
    total_forecast_periods_sum = 0
    average_temperature_sum = 0
    coolest_temperature_sum = 0
    hottest_temperature_sum = 0
    average_rain_probability_sum = 0
    highest_rain_probability_sum = 0
    count = 0

    for row in reader:
        # Skip the first row (header)
        if reader.line_num == 1:
            continue
        # Process the row data as needed
        location = row[0]
        total_forecast_periods = row[1]
        average_temperature = row[2]
        coolest_temperature = row[3]
        hottest_temperature = row[4]
        average_rain_probability = row[5]
        highest_rain_probability = row[6]
        start_date = row[7]
        end_date = row[8]

        total_forecast_periods_sum += int(total_forecast_periods)
        average_temperature_sum += float(average_temperature)
        coolest_temperature_sum += float(coolest_temperature)
        hottest_temperature_sum += float(hottest_temperature)
        average_rain_probability_sum += int(average_rain_probability)
        highest_rain_probability_sum += int(highest_rain_probability)
        count += 1

print("Commands: ")
print("1. View total forecast periods")
print("2. View average temperature")
print("3. View coolest temperature")
print("4. View hottest temperature")
print("5. View average rain probability")
print("6. View highest rain probability")
print("7. View start date")
print("8. View end date")
print("9. View average across all locations")

choice = input("Enter your choice: ")

if choice == "1":
    print("Total forecast periods:", total_forecast_periods_sum)
elif choice == "2":
    print("Average temperature:", average_temperature_sum / count if count > 0 else 0)
elif choice == "3":
    print("Coolest temperature:", coolest_temperature_sum / count if count > 0 else 0)
elif choice == "4":
    print("Hottest temperature:", hottest_temperature_sum / count if count > 0 else 0)
elif choice == "5":
    print("Average rain probability:", average_rain_probability_sum / count if count > 0 else 0)
elif choice == "6":
    print("Highest rain probability:", highest_rain_probability_sum / count if count > 0 else 0)
elif choice == "7":
    print("Start date:", start_date)
elif choice == "8":
    print("End date:", end_date)
elif choice == "9":
    print("Average across all locations:")
    print("Total forecast periods:", total_forecast_periods_sum / count if count > 0 else 0)
    print("Average temperature:", average_temperature_sum / count if count > 0 else 0)
    print("Coolest temperature:", coolest_temperature_sum / count if count > 0 else 0)
    print("Hottest temperature:", hottest_temperature_sum / count if count > 0 else 0)
    print("Average rain probability:", average_rain_probability_sum / count if count > 0 else 0)
    print("Highest rain probability:", highest_rain_probability_sum / count if count > 0 else 0)