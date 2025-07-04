/// Contains a comprehensive database of countries with their dial codes, flags, and codes.
///
/// This class provides static access to a list of all countries supported by the dial code picker.
/// Each country entry includes the country name, flag emoji, ISO country code, and international dial code.
///
/// The database includes over 200 countries and territories, making it suitable for most international applications.
///
/// Example:
/// ```dart
/// // Access the country data
/// final countries = CountryDatabase.data;
///
/// // Find a specific country
/// final usData = countries.firstWhere((country) => country['code'] == 'US');
/// final country = Country.fromMap(usData);
/// ```
class CountryDatabase {
  /// A static list containing all country data as Map objects.
  ///
  /// Each map contains the following keys:
  /// - `name`: The full country name (e.g., "United States")
  /// - `flag`: The flag emoji (e.g., "🇺🇸")
  /// - `code`: The ISO 3166-1 alpha-2 country code (e.g., "US")
  /// - `dial`: The international dial code with plus sign (e.g., "+1")
  ///
  /// This data can be used to create [Country] objects using [Country.fromMap].
  static const List data = [
    {"name": "Afghanistan", "flag": "🇦🇫", "code": "AF", "dial": "+93"},
    {"name": "Åland Islands", "flag": "🇦🇽", "code": "AX", "dial": "+358"},
    {"name": "Albania", "flag": "🇦🇱", "code": "AL", "dial": "+355"},
    {"name": "Algeria", "flag": "🇩🇿", "code": "DZ", "dial": "+213"},
    {"name": "American Samoa", "flag": "🇦🇸", "code": "AS", "dial": "+1684"},
    {"name": "Andorra", "flag": "🇦🇩", "code": "AD", "dial": "+376"},
    {"name": "Angola", "flag": "🇦🇴", "code": "AO", "dial": "+244"},
    {"name": "Anguilla", "flag": "🇦🇮", "code": "AI", "dial": "+1264"},
    {"name": "Antarctica", "flag": "🇦🇶", "code": "AQ", "dial": "+672"},
    {
      "name": "Antigua and Barbuda",
      "flag": "🇦🇬",
      "code": "AG",
      "dial": "+1268",
    },
    {"name": "Argentina", "flag": "🇦🇷", "code": "AR", "dial": "+54"},
    {"name": "Armenia", "flag": "🇦🇲", "code": "AM", "dial": "+374"},
    {"name": "Aruba", "flag": "🇦🇼", "code": "AW", "dial": "+297"},
    {"name": "Australia", "flag": "🇦🇺", "code": "AU", "dial": "+61"},
    {"name": "Austria", "flag": "🇦🇹", "code": "AT", "dial": "+43"},
    {"name": "Azerbaijan", "flag": "🇦🇿", "code": "AZ", "dial": "+994"},
    {"name": "Bahamas", "flag": "🇧🇸", "code": "BS", "dial": "+1242"},
    {"name": "Bahrain", "flag": "🇧🇭", "code": "BH", "dial": "+973"},
    {"name": "Bangladesh", "flag": "🇧🇩", "code": "BD", "dial": "+880"},
    {"name": "Barbados", "flag": "🇧🇧", "code": "BB", "dial": "+1246"},
    {"name": "Belarus", "flag": "🇧🇾", "code": "BY", "dial": "+375"},
    {"name": "Belgium", "flag": "🇧🇪", "code": "BE", "dial": "+32"},
    {"name": "Belize", "flag": "🇧🇿", "code": "BZ", "dial": "+501"},
    {"name": "Benin", "flag": "🇧🇯", "code": "BJ", "dial": "+229"},
    {"name": "Bermuda", "flag": "🇧🇲", "code": "BM", "dial": "+1441"},
    {"name": "Bhutan", "flag": "🇧🇹", "code": "BT", "dial": "+975"},
    {
      "name": "Bolivia, Plurinational State of bolivia",
      "flag": "🇧🇴",
      "code": "BO",
      "dial": "+591",
    },
    {
      "name": "Bosnia and Herzegovina",
      "flag": "🇧🇦",
      "code": "BA",
      "dial": "+387",
    },
    {"name": "Botswana", "flag": "🇧🇼", "code": "BW", "dial": "+267"},
    {"name": "Bouvet Island", "flag": "🇧🇻", "code": "BV", "dial": "+47"},
    {"name": "Brazil", "flag": "🇧🇷", "code": "BR", "dial": "+55"},
    {
      "name": "British Indian Ocean Territory",
      "flag": "🇮🇴",
      "code": "IO",
      "dial": "+246",
    },
    {"name": "Brunei Darussalam", "flag": "🇧🇳", "code": "BN", "dial": "+673"},
    {"name": "Bulgaria", "flag": "🇧🇬", "code": "BG", "dial": "+359"},
    {"name": "Burkina Faso", "flag": "🇧🇫", "code": "BF", "dial": "+226"},
    {"name": "Burundi", "flag": "🇧🇮", "code": "BI", "dial": "+257"},
    {"name": "Cambodia", "flag": "🇰🇭", "code": "KH", "dial": "+855"},
    {"name": "Cameroon", "flag": "🇨🇲", "code": "CM", "dial": "+237"},
    {"name": "Canada", "flag": "🇨🇦", "code": "CA", "dial": "+1"},
    {"name": "Cape Verde", "flag": "🇨🇻", "code": "CV", "dial": "+238"},
    {"name": "Cayman Islands", "flag": "🇰🇾", "code": "KY", "dial": "+345"},
    {
      "name": "Central African Republic",
      "flag": "🇨🇫",
      "code": "CF",
      "dial": "+236",
    },
    {"name": "Chad", "flag": "🇹🇩", "code": "TD", "dial": "+235"},
    {"name": "Chile", "flag": "🇨🇱", "code": "CL", "dial": "+56"},
    {"name": "China", "flag": "🇨🇳", "code": "CN", "dial": "+86"},
    {"name": "Christmas Island", "flag": "🇨🇽", "code": "CX", "dial": "+61"},
    {
      "name": "Cocos (Keeling) Islands",
      "flag": "🇨🇨",
      "code": "CC",
      "dial": "+61",
    },
    {"name": "Colombia", "flag": "🇨🇴", "code": "CO", "dial": "+57"},
    {"name": "Comoros", "flag": "🇰🇲", "code": "KM", "dial": "+269"},
    {"name": "Congo", "flag": "🇨🇬", "code": "CG", "dial": "+242"},
    {
      "name": "Congo, The Democratic Republic of the Congo",
      "flag": "🇨🇩",
      "code": "CD",
      "dial": "+243",
    },
    {"name": "Cook Islands", "flag": "🇨🇰", "code": "CK", "dial": "+682"},
    {"name": "Costa Rica", "flag": "🇨🇷", "code": "CR", "dial": "+506"},
    {"name": "Cote d'Ivoire", "flag": "🇨🇮", "code": "CI", "dial": "+225"},
    {"name": "Croatia", "flag": "🇭🇷", "code": "HR", "dial": "+385"},
    {"name": "Cuba", "flag": "🇨🇺", "code": "CU", "dial": "+53"},
    {"name": "Cyprus", "flag": "🇨🇾", "code": "CY", "dial": "+357"},
    {"name": "Czech Republic", "flag": "🇨🇿", "code": "CZ", "dial": "+420"},
    {"name": "Denmark", "flag": "🇩🇰", "code": "DK", "dial": "+45"},
    {"name": "Djibouti", "flag": "🇩🇯", "code": "DJ", "dial": "+253"},
    {"name": "Dominica", "flag": "🇩🇲", "code": "DM", "dial": "+1767"},
    {
      "name": "Dominican Republic",
      "flag": "🇩🇴",
      "code": "DO",
      "dial": "+1849",
    },
    {"name": "Ecuador", "flag": "🇪🇨", "code": "EC", "dial": "+593"},
    {"name": "Egypt", "flag": "🇪🇬", "code": "EG", "dial": "+20"},
    {"name": "El Salvador", "flag": "🇸🇻", "code": "SV", "dial": "+503"},
    {"name": "Equatorial Guinea", "flag": "🇬🇶", "code": "GQ", "dial": "+240"},
    {"name": "Eritrea", "flag": "🇪🇷", "code": "ER", "dial": "+291"},
    {"name": "Estonia", "flag": "🇪🇪", "code": "EE", "dial": "+372"},
    {"name": "Ethiopia", "flag": "🇪🇹", "code": "ET", "dial": "+251"},
    {
      "name": "Falkland Islands (Malvinas)",
      "flag": "🇫🇰",
      "code": "FK",
      "dial": "+500",
    },
    {"name": "Faroe Islands", "flag": "🇫🇴", "code": "FO", "dial": "+298"},
    {"name": "Fiji", "flag": "🇫🇯", "code": "FJ", "dial": "+679"},
    {"name": "Finland", "flag": "🇫🇮", "code": "FI", "dial": "+358"},
    {"name": "France", "flag": "🇫🇷", "code": "FR", "dial": "+33"},
    {"name": "French Guiana", "flag": "🇬🇫", "code": "GF", "dial": "+594"},
    {"name": "French Polynesia", "flag": "🇵🇫", "code": "PF", "dial": "+689"},
    {
      "name": "French Southern Territories",
      "flag": "🇹🇫",
      "code": "TF",
      "dial": "+262",
    },
    {"name": "Gabon", "flag": "🇬🇦", "code": "GA", "dial": "+241"},
    {"name": "Gambia", "flag": "🇬🇲", "code": "GM", "dial": "+220"},
    {"name": "Georgia", "flag": "🇬🇪", "code": "GE", "dial": "+995"},
    {"name": "Germany", "flag": "🇩🇪", "code": "DE", "dial": "+49"},
    {"name": "Ghana", "flag": "🇬🇭", "code": "GH", "dial": "+233"},
    {"name": "Gibraltar", "flag": "🇬🇮", "code": "GI", "dial": "+350"},
    {"name": "Greece", "flag": "🇬🇷", "code": "GR", "dial": "+30"},
    {"name": "Greenland", "flag": "🇬🇱", "code": "GL", "dial": "+299"},
    {"name": "Grenada", "flag": "🇬🇩", "code": "GD", "dial": "+1473"},
    {"name": "Guadeloupe", "flag": "🇬🇵", "code": "GP", "dial": "+590"},
    {"name": "Guam", "flag": "🇬🇺", "code": "GU", "dial": "+1671"},
    {"name": "Guatemala", "flag": "🇬🇹", "code": "GT", "dial": "+502"},
    {"name": "Guernsey", "flag": "🇬🇬", "code": "GG", "dial": "+44"},
    {"name": "Guinea", "flag": "🇬🇳", "code": "GN", "dial": "+224"},
    {"name": "Guinea-Bissau", "flag": "🇬🇼", "code": "GW", "dial": "+245"},
    {"name": "Guyana", "flag": "🇬🇾", "code": "GY", "dial": "+592"},
    {"name": "Haiti", "flag": "🇭🇹", "code": "HT", "dial": "+509"},
    {
      "name": "Heard Island and Mcdonald Islands",
      "flag": "🇭🇲",
      "code": "HM",
      "dial": "+672",
    },
    {
      "name": "Holy See (Vatican City State)",
      "flag": "🇻🇦",
      "code": "VA",
      "dial": "+379",
    },
    {"name": "Honduras", "flag": "🇭🇳", "code": "HN", "dial": "+504"},
    {"name": "Hong Kong", "flag": "🇭🇰", "code": "HK", "dial": "+852"},
    {"name": "Hungary", "flag": "🇭🇺", "code": "HU", "dial": "+36"},
    {"name": "Iceland", "flag": "🇮🇸", "code": "IS", "dial": "+354"},
    {"name": "India", "flag": "🇮🇳", "code": "IN", "dial": "+91"},
    {"name": "Indonesia", "flag": "🇮🇩", "code": "ID", "dial": "+62"},
    {
      "name": "Iran, Islamic Republic of Persian Gulf",
      "flag": "🇮🇷",
      "code": "IR",
      "dial": "+98",
    },
    {"name": "Iraq", "flag": "🇮🇶", "code": "IQ", "dial": "+964"},
    {"name": "Ireland", "flag": "🇮🇪", "code": "IE", "dial": "+353"},
    {"name": "Isle of Man", "flag": "🇮🇲", "code": "IM", "dial": "+44"},
    {"name": "Israel", "flag": "🇮🇱", "code": "IL", "dial": "+972"},
    {"name": "Italy", "flag": "🇮🇹", "code": "IT", "dial": "+39"},
    {"name": "Jamaica", "flag": "🇯🇲", "code": "JM", "dial": "+1876"},
    {"name": "Japan", "flag": "🇯🇵", "code": "JP", "dial": "+81"},
    {"name": "Jersey", "flag": "🇯🇪", "code": "JE", "dial": "+44"},
    {"name": "Jordan", "flag": "🇯🇴", "code": "JO", "dial": "+962"},
    {"name": "Kazakhstan", "flag": "🇰🇿", "code": "KZ", "dial": "+7"},
    {"name": "Kenya", "flag": "🇰🇪", "code": "KE", "dial": "+254"},
    {"name": "Kiribati", "flag": "🇰🇮", "code": "KI", "dial": "+686"},
    {
      "name": "Korea, Democratic People's Republic of Korea",
      "flag": "🇰🇵",
      "code": "KP",
      "dial": "+850",
    },
    {
      "name": "Korea, Republic of South Korea",
      "flag": "🇰🇷",
      "code": "KR",
      "dial": "+82",
    },
    {"name": "Kosovo", "flag": "🇽🇰", "code": "XK", "dial": "+383"},
    {"name": "Kuwait", "flag": "🇰🇼", "code": "KW", "dial": "+965"},
    {"name": "Kyrgyzstan", "flag": "🇰🇬", "code": "KG", "dial": "+996"},
    {"name": "Laos", "flag": "🇱🇦", "code": "LA", "dial": "+856"},
    {"name": "Latvia", "flag": "🇱🇻", "code": "LV", "dial": "+371"},
    {"name": "Lebanon", "flag": "🇱🇧", "code": "LB", "dial": "+961"},
    {"name": "Lesotho", "flag": "🇱🇸", "code": "LS", "dial": "+266"},
    {"name": "Liberia", "flag": "🇱🇷", "code": "LR", "dial": "+231"},
    {
      "name": "Libyan Arab Jamahiriya",
      "flag": "🇱🇾",
      "code": "LY",
      "dial": "+218",
    },
    {"name": "Liechtenstein", "flag": "🇱🇮", "code": "LI", "dial": "+423"},
    {"name": "Lithuania", "flag": "🇱🇹", "code": "LT", "dial": "+370"},
    {"name": "Luxembourg", "flag": "🇱🇺", "code": "LU", "dial": "+352"},
    {"name": "Macao", "flag": "🇲🇴", "code": "MO", "dial": "+853"},
    {"name": "Macedonia", "flag": "🇲🇰", "code": "MK", "dial": "+389"},
    {"name": "Madagascar", "flag": "🇲🇬", "code": "MG", "dial": "+261"},
    {"name": "Malawi", "flag": "🇲🇼", "code": "MW", "dial": "+265"},
    {"name": "Malaysia", "flag": "🇲🇾", "code": "MY", "dial": "+60"},
    {"name": "Maldives", "flag": "🇲🇻", "code": "MV", "dial": "+960"},
    {"name": "Mali", "flag": "🇲🇱", "code": "ML", "dial": "+223"},
    {"name": "Malta", "flag": "🇲🇹", "code": "MT", "dial": "+356"},
    {"name": "Marshall Islands", "flag": "🇲🇭", "code": "MH", "dial": "+692"},
    {"name": "Martinique", "flag": "🇲🇶", "code": "MQ", "dial": "+596"},
    {"name": "Mauritania", "flag": "🇲🇷", "code": "MR", "dial": "+222"},
    {"name": "Mauritius", "flag": "🇲🇺", "code": "MU", "dial": "+230"},
    {"name": "Mayotte", "flag": "🇾🇹", "code": "YT", "dial": "+262"},
    {"name": "Mexico", "flag": "🇲🇽", "code": "MX", "dial": "+52"},
    {
      "name": "Micronesia, Federated States of Micronesia",
      "flag": "🇫🇲",
      "code": "FM",
      "dial": "+691",
    },
    {"name": "Moldova", "flag": "🇲🇩", "code": "MD", "dial": "+373"},
    {"name": "Monaco", "flag": "🇲🇨", "code": "MC", "dial": "+377"},
    {"name": "Mongolia", "flag": "🇲🇳", "code": "MN", "dial": "+976"},
    {"name": "Montenegro", "flag": "🇲🇪", "code": "ME", "dial": "+382"},
    {"name": "Montserrat", "flag": "🇲🇸", "code": "MS", "dial": "+1664"},
    {"name": "Morocco", "flag": "🇲🇦", "code": "MA", "dial": "+212"},
    {"name": "Mozambique", "flag": "🇲🇿", "code": "MZ", "dial": "+258"},
    {"name": "Myanmar", "flag": "🇲🇲", "code": "MM", "dial": "+95"},
    {"name": "Namibia", "flag": "🇳🇦", "code": "NA", "dial": "+264"},
    {"name": "Nauru", "flag": "🇳🇷", "code": "NR", "dial": "+674"},
    {"name": "Nepal", "flag": "🇳🇵", "code": "NP", "dial": "+977"},
    {"name": "Netherlands", "flag": "🇳🇱", "code": "NL", "dial": "+31"},
    {"name": "Netherlands Antilles", "flag": "", "code": "AN", "dial": "+599"},
    {"name": "New Caledonia", "flag": "🇳🇨", "code": "NC", "dial": "+687"},
    {"name": "New Zealand", "flag": "🇳🇿", "code": "NZ", "dial": "+64"},
    {"name": "Nicaragua", "flag": "🇳🇮", "code": "NI", "dial": "+505"},
    {"name": "Niger", "flag": "🇳🇪", "code": "NE", "dial": "+227"},
    {"name": "Nigeria", "flag": "🇳🇬", "code": "NG", "dial": "+234"},
    {"name": "Niue", "flag": "🇳🇺", "code": "NU", "dial": "+683"},
    {"name": "Norfolk Island", "flag": "🇳🇫", "code": "NF", "dial": "+672"},
    {
      "name": "Northern Mariana Islands",
      "flag": "🇲🇵",
      "code": "MP",
      "dial": "+1670",
    },
    {"name": "Norway", "flag": "🇳🇴", "code": "NO", "dial": "+47"},
    {"name": "Oman", "flag": "🇴🇲", "code": "OM", "dial": "+968"},
    {"name": "Pakistan", "flag": "🇵🇰", "code": "PK", "dial": "+92"},
    {"name": "Palau", "flag": "🇵🇼", "code": "PW", "dial": "+680"},
    {
      "name": "Palestinian Territory, Occupied",
      "flag": "🇵🇸",
      "code": "PS",
      "dial": "+970",
    },
    {"name": "Panama", "flag": "🇵🇦", "code": "PA", "dial": "+507"},
    {"name": "Papua New Guinea", "flag": "🇵🇬", "code": "PG", "dial": "+675"},
    {"name": "Paraguay", "flag": "🇵🇾", "code": "PY", "dial": "+595"},
    {"name": "Peru", "flag": "🇵🇪", "code": "PE", "dial": "+51"},
    {"name": "Philippines", "flag": "🇵🇭", "code": "PH", "dial": "+63"},
    {"name": "Pitcairn", "flag": "🇵🇳", "code": "PN", "dial": "+64"},
    {"name": "Poland", "flag": "🇵🇱", "code": "PL", "dial": "+48"},
    {"name": "Portugal", "flag": "🇵🇹", "code": "PT", "dial": "+351"},
    {"name": "Puerto Rico", "flag": "🇵🇷", "code": "PR", "dial": "+1939"},
    {"name": "Qatar", "flag": "🇶🇦", "code": "QA", "dial": "+974"},
    {"name": "Romania", "flag": "🇷🇴", "code": "RO", "dial": "+40"},
    {"name": "Russia", "flag": "🇷🇺", "code": "RU", "dial": "+7"},
    {"name": "Rwanda", "flag": "🇷🇼", "code": "RW", "dial": "+250"},
    {"name": "Reunion", "flag": "🇷🇪", "code": "RE", "dial": "+262"},
    {"name": "Saint Barthelemy", "flag": "🇧🇱", "code": "BL", "dial": "+590"},
    {
      "name": "Saint Helena, Ascension and Tristan Da Cunha",
      "flag": "🇸🇭",
      "code": "SH",
      "dial": "+290",
    },
    {
      "name": "Saint Kitts and Nevis",
      "flag": "🇰🇳",
      "code": "KN",
      "dial": "+1869",
    },
    {"name": "Saint Lucia", "flag": "🇱🇨", "code": "LC", "dial": "+1758"},
    {"name": "Saint Martin", "flag": "🇲🇫", "code": "MF", "dial": "+590"},
    {
      "name": "Saint Pierre and Miquelon",
      "flag": "🇵🇲",
      "code": "PM",
      "dial": "+508",
    },
    {
      "name": "Saint Vincent and the Grenadines",
      "flag": "🇻🇨",
      "code": "VC",
      "dial": "+1784",
    },
    {"name": "Samoa", "flag": "🇼🇸", "code": "WS", "dial": "+685"},
    {"name": "San Marino", "flag": "🇸🇲", "code": "SM", "dial": "+378"},
    {
      "name": "Sao Tome and Principe",
      "flag": "🇸🇹",
      "code": "ST",
      "dial": "+239",
    },
    {"name": "Saudi Arabia", "flag": "🇸🇦", "code": "SA", "dial": "+966"},
    {"name": "Senegal", "flag": "🇸🇳", "code": "SN", "dial": "+221"},
    {"name": "Serbia", "flag": "🇷🇸", "code": "RS", "dial": "+381"},
    {"name": "Seychelles", "flag": "🇸🇨", "code": "SC", "dial": "+248"},
    {"name": "Sierra Leone", "flag": "🇸🇱", "code": "SL", "dial": "+232"},
    {"name": "Singapore", "flag": "🇸🇬", "code": "SG", "dial": "+65"},
    {"name": "Slovakia", "flag": "🇸🇰", "code": "SK", "dial": "+421"},
    {"name": "Slovenia", "flag": "🇸🇮", "code": "SI", "dial": "+386"},
    {"name": "Solomon Islands", "flag": "🇸🇧", "code": "SB", "dial": "+677"},
    {"name": "Somalia", "flag": "🇸🇴", "code": "SO", "dial": "+252"},
    {"name": "South Africa", "flag": "🇿🇦", "code": "ZA", "dial": "+27"},
    {"name": "South Sudan", "flag": "🇸🇸", "code": "SS", "dial": "+211"},
    {
      "name": "South Georgia and the South Sandwich Islands",
      "flag": "🇬🇸",
      "code": "GS",
      "dial": "+500",
    },
    {"name": "Spain", "flag": "🇪🇸", "code": "ES", "dial": "+34"},
    {"name": "Sri Lanka", "flag": "🇱🇰", "code": "LK", "dial": "+94"},
    {"name": "Sudan", "flag": "🇸🇩", "code": "SD", "dial": "+249"},
    {"name": "Suriname", "flag": "🇸🇷", "code": "SR", "dial": "+597"},
    {
      "name": "Svalbard and Jan Mayen",
      "flag": "🇸🇯",
      "code": "SJ",
      "dial": "+47",
    },
    {"name": "Eswatini", "flag": "🇸🇿", "code": "SZ", "dial": "+268"},
    {"name": "Sweden", "flag": "🇸🇪", "code": "SE", "dial": "+46"},
    {"name": "Switzerland", "flag": "🇨🇭", "code": "CH", "dial": "+41"},
    {
      "name": "Syrian Arab Republic",
      "flag": "🇸🇾",
      "code": "SY",
      "dial": "+963",
    },
    {"name": "Taiwan", "flag": "🇹🇼", "code": "TW", "dial": "+886"},
    {"name": "Tajikistan", "flag": "🇹🇯", "code": "TJ", "dial": "+992"},
    {
      "name": "Tanzania, United Republic of Tanzania",
      "flag": "🇹🇿",
      "code": "TZ",
      "dial": "+255",
    },
    {"name": "Thailand", "flag": "🇹🇭", "code": "TH", "dial": "+66"},
    {"name": "Timor-Leste", "flag": "🇹🇱", "code": "TL", "dial": "+670"},
    {"name": "Togo", "flag": "🇹🇬", "code": "TG", "dial": "+228"},
    {"name": "Tokelau", "flag": "🇹🇰", "code": "TK", "dial": "+690"},
    {"name": "Tonga", "flag": "🇹🇴", "code": "TO", "dial": "+676"},
    {
      "name": "Trinidad and Tobago",
      "flag": "🇹🇹",
      "code": "TT",
      "dial": "+1868",
    },
    {"name": "Tunisia", "flag": "🇹🇳", "code": "TN", "dial": "+216"},
    {"name": "Turkey", "flag": "🇹🇷", "code": "TR", "dial": "+90"},
    {"name": "Turkmenistan", "flag": "🇹🇲", "code": "TM", "dial": "+993"},
    {
      "name": "Turks and Caicos Islands",
      "flag": "🇹🇨",
      "code": "TC",
      "dial": "+1649",
    },
    {"name": "Tuvalu", "flag": "🇹🇻", "code": "TV", "dial": "+688"},
    {"name": "Uganda", "flag": "🇺🇬", "code": "UG", "dial": "+256"},
    {"name": "Ukraine", "flag": "🇺🇦", "code": "UA", "dial": "+380"},
    {
      "name": "United Arab Emirates",
      "flag": "🇦🇪",
      "code": "AE",
      "dial": "+971",
    },
    {"name": "United Kingdom", "flag": "🇬🇧", "code": "GB", "dial": "+44"},
    {"name": "United States", "flag": "🇺🇸", "code": "US", "dial": "+1"},
    {"name": "Uruguay", "flag": "🇺🇾", "code": "UY", "dial": "+598"},
    {"name": "Uzbekistan", "flag": "🇺🇿", "code": "UZ", "dial": "+998"},
    {"name": "Vanuatu", "flag": "🇻🇺", "code": "VU", "dial": "+678"},
    {
      "name": "Venezuela, Bolivarian Republic of Venezuela",
      "flag": "🇻🇪",
      "code": "VE",
      "dial": "+58",
    },
    {"name": "Vietnam", "flag": "🇻🇳", "code": "VN", "dial": "+84"},
    {
      "name": "Virgin Islands, British",
      "flag": "🇻🇬",
      "code": "VG",
      "dial": "+1284",
    },
    {
      "name": "Virgin Islands, U.S.",
      "flag": "🇻🇮",
      "code": "VI",
      "dial": "+1340",
    },
    {"name": "Wallis and Futuna", "flag": "🇼🇫", "code": "WF", "dial": "+681"},
    {"name": "Yemen", "flag": "🇾🇪", "code": "YE", "dial": "+967"},
    {"name": "Zambia", "flag": "🇿🇲", "code": "ZM", "dial": "+260"},
    {"name": "Zimbabwe", "flag": "🇿🇼", "code": "ZW", "dial": "+263"},
  ];
}
