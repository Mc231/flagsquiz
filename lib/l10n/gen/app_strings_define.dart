// DO NOT EDIT. This is code generated via package:intl_manager

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AppStringsDefine {
  static const List<String> _supportedLanguageCode = ['mt','no','ur','vi','nl','ms','la','tr','lb','ar','ka','ru','fr','ga','hy','sr','sv','el','fa','pl','hi','ja','en','et','iw','he','hr','pt','kk','it','de','sl','da','fi','hu','ko','es','ro','sk','is','id','uz','bs','mk','be','ca','th','bg','ne','uk','tl','az','cs'];
  static const List<List<String>> _supportedLocaleMap = [['mt',''],['no',''],['ur',''],['vi',''],['nl',''],['ms',''],['la',''],['tr',''],['lb',''],['ar',''],['ka',''],['ru',''],['fr',''],['ga',''],['hy',''],['sr',''],['sv',''],['el',''],['fa',''],['pl',''],['hi',''],['ja',''],['en',''],['et',''],['iw',''],['he',''],['hr',''],['pt',''],['kk',''],['it',''],['de',''],['sl',''],['da',''],['fi',''],['hu',''],['ko',''],['es',''],['ro',''],['sk',''],['is',''],['id',''],['uz',''],['bs',''],['mk',''],['be',''],['ca',''],['th',''],['bg',''],['ne',''],['uk',''],['tl',''],['az',''],['cs','']];

  static List<String> getSupportedLanguageCodes(){
    return _supportedLanguageCode;
  }

  static List<Locale> createSupportedLocale(bool appendCountryCode){
    var result = <Locale>[];
    for (var c in _supportedLocaleMap) {
      result.add(Locale(c[0], appendCountryCode ? c[1] : ''));
    }
    return result;
  }

  String get selectRegion => Intl.message('Select Region', name: 'selectRegion');
  String get All => Intl.message('All', name: 'All');
  String get Europe => Intl.message('Europe', name: 'Europe');
  String get Asia => Intl.message('Asia', name: 'Asia');
  String get Africa => Intl.message('Africa', name: 'Africa');
  String get northAmerica => Intl.message('North America', name: 'northAmerica');
  String get southAmerica => Intl.message('South America', name: 'southAmerica');
  String get Oceania => Intl.message('Oceania', name: 'Oceania');
  String get yourScore => Intl.message('Your Score', name: 'yourScore');
  String get AD => Intl.message('Andorra', name: 'AD');
  String get AE => Intl.message('United Arab Emirates', name: 'AE');
  String get AG => Intl.message('Antigua and Barbuda', name: 'AG');
  String get AI => Intl.message('Anguilla', name: 'AI');
  String get AF => Intl.message('Afghanistan', name: 'AF');
  String get AL => Intl.message('Albania', name: 'AL');
  String get AM => Intl.message('Armenia', name: 'AM');
  String get AO => Intl.message('Angola', name: 'AO');
  String get AQ => Intl.message('Antarctica', name: 'AQ');
  String get AR => Intl.message('Argentina', name: 'AR');
  String get AS => Intl.message('American Samoa', name: 'AS');
  String get AT => Intl.message('Austria', name: 'AT');
  String get AU => Intl.message('Australia', name: 'AU');
  String get AW => Intl.message('Aruba', name: 'AW');
  String get AX => Intl.message('Åland', name: 'AX');
  String get AZ => Intl.message('Azerbaijan', name: 'AZ');
  String get BA => Intl.message('Bosnia and Herzegovina', name: 'BA');
  String get BB => Intl.message('Barbados', name: 'BB');
  String get BD => Intl.message('Bangladesh', name: 'BD');
  String get BE => Intl.message('Belgium', name: 'BE');
  String get BF => Intl.message('Burkina Faso', name: 'BF');
  String get BG => Intl.message('Bulgaria', name: 'BG');
  String get BH => Intl.message('Bahrain', name: 'BH');
  String get BI => Intl.message('Burundi', name: 'BI');
  String get BJ => Intl.message('Benin', name: 'BJ');
  String get BL => Intl.message('Saint Barthélemy', name: 'BL');
  String get BM => Intl.message('Bermuda', name: 'BM');
  String get BN => Intl.message('Brunei', name: 'BN');
  String get BO => Intl.message('Bolivia', name: 'BO');
  String get BQ => Intl.message('Bonaire', name: 'BQ');
  String get BR => Intl.message('Brazil', name: 'BR');
  String get BS => Intl.message('Bahamas', name: 'BS');
  String get BT => Intl.message('Bhutan', name: 'BT');
  String get BV => Intl.message('Bouvet Island', name: 'BV');
  String get BW => Intl.message('Botswana', name: 'BW');
  String get BY => Intl.message('Belarus', name: 'BY');
  String get BZ => Intl.message('Belize', name: 'BZ');
  String get CA => Intl.message('Canada', name: 'CA');
  String get CC => Intl.message('Cocos [Keeling] Islands', name: 'CC');
  String get CD => Intl.message('Democratic Republic of the Congo', name: 'CD');
  String get CF => Intl.message('Central African Republic', name: 'CF');
  String get CG => Intl.message('Republic of the Congo', name: 'CG');
  String get CH => Intl.message('Switzerland', name: 'CH');
  String get CI => Intl.message('Ivory Coast', name: 'CI');
  String get CK => Intl.message('Cook Islands', name: 'CK');
  String get CL => Intl.message('Chile', name: 'CL');
  String get CM => Intl.message('Cameroon', name: 'CM');
  String get CN => Intl.message('China', name: 'CN');
  String get CO => Intl.message('Colombia', name: 'CO');
  String get CR => Intl.message('Costa Rica', name: 'CR');
  String get CU => Intl.message('Cuba', name: 'CU');
  String get CV => Intl.message('Cape Verde', name: 'CV');
  String get CW => Intl.message('Curacao', name: 'CW');
  String get CX => Intl.message('Christmas Island', name: 'CX');
  String get CY => Intl.message('Cyprus', name: 'CY');
  String get CZ => Intl.message('Czech Republic', name: 'CZ');
  String get DE => Intl.message('Germany', name: 'DE');
  String get DJ => Intl.message('Djibouti', name: 'DJ');
  String get DK => Intl.message('Denmark', name: 'DK');
  String get DM => Intl.message('Dominica', name: 'DM');
  String get DO => Intl.message('Dominican Republic', name: 'DO');
  String get DZ => Intl.message('Algeria', name: 'DZ');
  String get EC => Intl.message('Ecuador', name: 'EC');
  String get EE => Intl.message('Estonia', name: 'EE');
  String get EG => Intl.message('Egypt', name: 'EG');
  String get EH => Intl.message('Western Sahara', name: 'EH');
  String get ER => Intl.message('Eritrea', name: 'ER');
  String get ES => Intl.message('Spain', name: 'ES');
  String get ET => Intl.message('Ethiopia', name: 'ET');
  String get FI => Intl.message('Finland', name: 'FI');
  String get FJ => Intl.message('Fiji', name: 'FJ');
  String get FK => Intl.message('Falkland Islands', name: 'FK');
  String get FM => Intl.message('Micronesia', name: 'FM');
  String get FO => Intl.message('Faroe Islands', name: 'FO');
  String get FR => Intl.message('France', name: 'FR');
  String get GA => Intl.message('Gabon', name: 'GA');
  String get GB => Intl.message('United Kingdom', name: 'GB');
  String get GD => Intl.message('Grenada', name: 'GD');
  String get GE => Intl.message('Georgia', name: 'GE');
  String get GF => Intl.message('French Guiana', name: 'GF');
  String get GG => Intl.message('Guernsey', name: 'GG');
  String get GH => Intl.message('Ghana', name: 'GH');
  String get GI => Intl.message('Gibraltar', name: 'GI');
  String get GL => Intl.message('Greenland', name: 'GL');
  String get GM => Intl.message('Gambia', name: 'GM');
  String get GN => Intl.message('Guinea', name: 'GN');
  String get GP => Intl.message('Guadeloupe', name: 'GP');
  String get GQ => Intl.message('Equatorial Guinea', name: 'GQ');
  String get GR => Intl.message('Greece', name: 'GR');
  String get GS => Intl.message('South Georgia and the South Sandwich Islands', name: 'GS');
  String get GT => Intl.message('Guatemala', name: 'GT');
  String get GU => Intl.message('Guam', name: 'GU');
  String get GW => Intl.message('Guinea-Bissau', name: 'GW');
  String get GY => Intl.message('Guyana', name: 'GY');
  String get HK => Intl.message('Hong Kong', name: 'HK');
  String get HM => Intl.message('Heard Island and McDonald Islands', name: 'HM');
  String get HN => Intl.message('Honduras', name: 'HN');
  String get HR => Intl.message('Croatia', name: 'HR');
  String get HT => Intl.message('Haiti', name: 'HT');
  String get HU => Intl.message('Hungary', name: 'HU');
  String get ID => Intl.message('Indonesia', name: 'ID');
  String get IE => Intl.message('Ireland', name: 'IE');
  String get IL => Intl.message('Israel', name: 'IL');
  String get IM => Intl.message('Isle of Man', name: 'IM');
  String get IN => Intl.message('India', name: 'IN');
  String get IO => Intl.message('British Indian Ocean Territory', name: 'IO');
  String get IQ => Intl.message('Iraq', name: 'IQ');
  String get IR => Intl.message('Iran', name: 'IR');
  String get IS => Intl.message('Iceland', name: 'IS');
  String get IT => Intl.message('Italy', name: 'IT');
  String get JE => Intl.message('Jersey', name: 'JE');
  String get JM => Intl.message('Jamaica', name: 'JM');
  String get JO => Intl.message('Jordan', name: 'JO');
  String get JP => Intl.message('Japan', name: 'JP');
  String get KE => Intl.message('Kenya', name: 'KE');
  String get KG => Intl.message('Kyrgyzstan', name: 'KG');
  String get KH => Intl.message('Cambodia', name: 'KH');
  String get KI => Intl.message('Kiribati', name: 'KI');
  String get KM => Intl.message('Comoros', name: 'KM');
  String get KN => Intl.message('Saint Kitts and Nevis', name: 'KN');
  String get KP => Intl.message('North Korea', name: 'KP');
  String get KR => Intl.message('South Korea', name: 'KR');
  String get KW => Intl.message('Kuwait', name: 'KW');
  String get KY => Intl.message('Cayman Islands', name: 'KY');
  String get KZ => Intl.message('Kazakhstan', name: 'KZ');
  String get LA => Intl.message('Laos', name: 'LA');
  String get LB => Intl.message('Lebanon', name: 'LB');
  String get LC => Intl.message('Saint Lucia', name: 'LC');
  String get LI => Intl.message('Liechtenstein', name: 'LI');
  String get LK => Intl.message('Sri Lanka', name: 'LK');
  String get LR => Intl.message('Liberia', name: 'LR');
  String get LS => Intl.message('Lesotho', name: 'LS');
  String get LT => Intl.message('Lithuania', name: 'LT');
  String get LU => Intl.message('Luxembourg', name: 'LU');
  String get LV => Intl.message('Latvia', name: 'LV');
  String get LY => Intl.message('Libya', name: 'LY');
  String get MA => Intl.message('Morocco', name: 'MA');
  String get MC => Intl.message('Monaco', name: 'MC');
  String get MD => Intl.message('Moldova', name: 'MD');
  String get ME => Intl.message('Montenegro', name: 'ME');
  String get MF => Intl.message('Saint Martin', name: 'MF');
  String get MG => Intl.message('Madagascar', name: 'MG');
  String get MH => Intl.message('Marshall Islands', name: 'MH');
  String get MK => Intl.message('North Macedonia', name: 'MK');
  String get ML => Intl.message('Mali', name: 'ML');
  String get MM => Intl.message('Myanmar [Burma]', name: 'MM');
  String get MN => Intl.message('Mongolia', name: 'MN');
  String get MO => Intl.message('Macao', name: 'MO');
  String get MP => Intl.message('Northern Mariana Islands', name: 'MP');
  String get MQ => Intl.message('Martinique', name: 'MQ');
  String get MR => Intl.message('Mauritania', name: 'MR');
  String get MS => Intl.message('Montserrat', name: 'MS');
  String get MT => Intl.message('Malta', name: 'MT');
  String get MU => Intl.message('Mauritius', name: 'MU');
  String get MV => Intl.message('Maldives', name: 'MV');
  String get MW => Intl.message('Malawi', name: 'MW');
  String get MX => Intl.message('Mexico', name: 'MX');
  String get MY => Intl.message('Malaysia', name: 'MY');
  String get MZ => Intl.message('Mozambique', name: 'MZ');
  String get NA => Intl.message('Namibia', name: 'NA');
  String get NC => Intl.message('New Caledonia', name: 'NC');
  String get NE => Intl.message('Niger', name: 'NE');
  String get NF => Intl.message('Norfolk Island', name: 'NF');
  String get NG => Intl.message('Nigeria', name: 'NG');
  String get NI => Intl.message('Nicaragua', name: 'NI');
  String get NL => Intl.message('Netherlands', name: 'NL');
  String get NO => Intl.message('Norway', name: 'NO');
  String get NP => Intl.message('Nepal', name: 'NP');
  String get NR => Intl.message('Nauru', name: 'NR');
  String get NU => Intl.message('Niue', name: 'NU');
  String get NZ => Intl.message('New Zealand', name: 'NZ');
  String get OM => Intl.message('Oman', name: 'OM');
  String get PA => Intl.message('Panama', name: 'PA');
  String get PE => Intl.message('Peru', name: 'PE');
  String get PF => Intl.message('French Polynesia', name: 'PF');
  String get PG => Intl.message('Papua New Guinea', name: 'PG');
  String get PH => Intl.message('Philippines', name: 'PH');
  String get PK => Intl.message('Pakistan', name: 'PK');
  String get PL => Intl.message('Poland', name: 'PL');
  String get PM => Intl.message('Saint Pierre and Miquelon', name: 'PM');
  String get PN => Intl.message('Pitcairn Islands', name: 'PN');
  String get PR => Intl.message('Puerto Rico', name: 'PR');
  String get PS => Intl.message('Palestine', name: 'PS');
  String get PT => Intl.message('Portugal', name: 'PT');
  String get PW => Intl.message('Palau', name: 'PW');
  String get PY => Intl.message('Paraguay', name: 'PY');
  String get QA => Intl.message('Qatar', name: 'QA');
  String get RE => Intl.message('Réunion', name: 'RE');
  String get RO => Intl.message('Romania', name: 'RO');
  String get RS => Intl.message('Serbia', name: 'RS');
  String get RU => Intl.message('Russia', name: 'RU');
  String get RW => Intl.message('Rwanda', name: 'RW');
  String get SA => Intl.message('Saudi Arabia', name: 'SA');
  String get SB => Intl.message('Solomon Islands', name: 'SB');
  String get SC => Intl.message('Seychelles', name: 'SC');
  String get SD => Intl.message('Sudan', name: 'SD');
  String get SE => Intl.message('Sweden', name: 'SE');
  String get SG => Intl.message('Singapore', name: 'SG');
  String get SH => Intl.message('Saint Helena', name: 'SH');
  String get SI => Intl.message('Slovenia', name: 'SI');
  String get SJ => Intl.message('Svalbard and Jan Mayen', name: 'SJ');
  String get SK => Intl.message('Slovakia', name: 'SK');
  String get SL => Intl.message('Sierra Leone', name: 'SL');
  String get SM => Intl.message('San Marino', name: 'SM');
  String get SN => Intl.message('Senegal', name: 'SN');
  String get SO => Intl.message('Somalia', name: 'SO');
  String get SR => Intl.message('Suriname', name: 'SR');
  String get SS => Intl.message('South Sudan', name: 'SS');
  String get ST => Intl.message('São Tomé and Príncipe', name: 'ST');
  String get SV => Intl.message('El Salvador', name: 'SV');
  String get SX => Intl.message('Sint Maarten', name: 'SX');
  String get SY => Intl.message('Syria', name: 'SY');
  String get SZ => Intl.message('Swaziland', name: 'SZ');
  String get TC => Intl.message('Turks and Caicos Islands', name: 'TC');
  String get TD => Intl.message('Chad', name: 'TD');
  String get TF => Intl.message('French Southern Territories', name: 'TF');
  String get TG => Intl.message('Togo', name: 'TG');
  String get TH => Intl.message('Thailand', name: 'TH');
  String get TJ => Intl.message('Tajikistan', name: 'TJ');
  String get TK => Intl.message('Tokelau', name: 'TK');
  String get TL => Intl.message('East Timor', name: 'TL');
  String get TM => Intl.message('Turkmenistan', name: 'TM');
  String get TN => Intl.message('Tunisia', name: 'TN');
  String get TO => Intl.message('Tonga', name: 'TO');
  String get TR => Intl.message('Turkey', name: 'TR');
  String get TT => Intl.message('Trinidad and Tobago', name: 'TT');
  String get TV => Intl.message('Tuvalu', name: 'TV');
  String get TW => Intl.message('Taiwan', name: 'TW');
  String get TZ => Intl.message('Tanzania', name: 'TZ');
  String get UA => Intl.message('Ukraine', name: 'UA');
  String get UG => Intl.message('Uganda', name: 'UG');
  String get UM => Intl.message('U.S. Minor Outlying Islands', name: 'UM');
  String get US => Intl.message('United States', name: 'US');
  String get UY => Intl.message('Uruguay', name: 'UY');
  String get UZ => Intl.message('Uzbekistan', name: 'UZ');
  String get VA => Intl.message('Vatican City', name: 'VA');
  String get VC => Intl.message('Saint Vincent and the Grenadines', name: 'VC');
  String get VE => Intl.message('Venezuela', name: 'VE');
  String get VG => Intl.message('British Virgin Islands', name: 'VG');
  String get VI => Intl.message('U.S. Virgin Islands', name: 'VI');
  String get VN => Intl.message('Vietnam', name: 'VN');
  String get VU => Intl.message('Vanuatu', name: 'VU');
  String get WF => Intl.message('Wallis and Futuna', name: 'WF');
  String get WS => Intl.message('Samoa', name: 'WS');
  String get XK => Intl.message('Kosovo', name: 'XK');
  String get YE => Intl.message('Yemen', name: 'YE');
  String get YT => Intl.message('Mayotte', name: 'YT');
  String get ZA => Intl.message('South Africa', name: 'ZA');
  String get ZM => Intl.message('Zambia', name: 'ZM');
  String get ZW => Intl.message('Zimbabwe', name: 'ZW');
}
