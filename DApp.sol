// версия языка solidity - 0.4.18 
pragma solidity ^0.4.18; 

contract dapp { 

    string login; 
    uint32 numOfFriends = 0; 
    uint32 numOfAccFriends = 0; 
    uint32 ii = 0; 

    string news0; 
    string news1; 
    string news2; 
    string news3; 
    string news4; 
    string news5; 

// структура User. Удобная группировка инфрмации в одном типе переменной 
    struct User { 
        string firstName; 
        string lastName; 
        string dateBirth; 
        string city; 
        string eMail; 
        string mobileNumber; 
    } 
    
    struct Meta { 
        string password; 
        string login; 
    }
    
    struct Friends { 
        uint32 numOfFriends; 
        uint32 numOfAccFriends; 
        string[] friends; 
        string[] acceptedFriends; 
    } 
    struct Messages { 
        string[] userMessages; 
        uint80 numUserMessages; 
    } 


// таблица пользователей users,metas 
    mapping (string => User) users; 
    mapping (string => Meta) metas; 
    mapping (string => Friends) friendsMap; 
    mapping (string => Messages) messagesMap; 

// мета-функция для создания данных для входа 
function newMetas(string _login, string _password) public{ 
    login = _login; 
    metas[login] = Meta(_login, _password); 
} 

// функция регистрации. входные параметры - имя, фамилия, дата рождения, город, почта, мобильный номер 
function newProfile(string _firstName, string _lastName, string _dateBirth, string _city, string _eMail, string _mobileNumber) public { 
    users[login] = User(_firstName, _lastName, _dateBirth, _city, _eMail, _mobileNumber); 

} 

// функция получения информации о профиле через ЛОГИН возвращает tuple (кортеж) вида (строка, строка, строка, строка, строка, строка) 
function getProfile(string _login) constant public returns(string, string, string, string, string, string, string) { 
    login = _login; 
        return (users[_login].firstName, users[_login].lastName, users[_login].dateBirth, users[_login].city, users[_login].eMail, users[_login].mobileNumber, metas[_login].login); 
} 

// Изменение информации в профиле 
function changeInfo(string _chFirstName, string _chLastName, string _chDateBirth, string _chCity, string _cheMail, string _chMobileNumber, string __login) public{ 
    users[__login] = User(_chFirstName, _chLastName, _chDateBirth, _chCity, _cheMail, _chMobileNumber); 
} 

function setNews(string _news0, string _news1, string _news2, string _news3, string _news4, string _news5) public { 
    news0 = _news0; 
    news1 = _news1; 
    news2 = _news2; 
    news3 = _news3; 
    news4 = _news4; 
    news5 = _news5; 
} 

function getNews() constant public returns (string, string, string, string, string, string){ 
    return(news0 ,news1 ,news2 ,news3 ,news4 ,news5); 
} 


function addFriend(string __login, string _loginOfFriend) public { 
    login = __login; 
    numOfFriends = friendsMap[login].numOfFriends; 
    friendsMap[login].friends[numOfFriends] = _loginOfFriend; 
    friendsMap[login].numOfFriends++; 
} 


// Тестовая, не доработанная функция
//функции для сравнения двух строковых переменных 
function compare(string _a, string _b) public returns (int) { 
bytes memory a = bytes(_a); 
bytes memory b = bytes(_b); 
uint minLength = a.length; 
if (b.length < minLength) minLength = b.length; 

for (uint i = 0; i < minLength; i ++) 
if (a[i] < b[i]) 
return -1; 
else if (a[i] > b[i]) 
return 1; 
if (a.length < b.length) 
return -1; 
else if (a.length > b.length) 
return 1; 
else 
return 0; 
} 
/// функция возвращающая true or false в зависимос 
function equal(string _a, string _b) public returns (bool) { 
return compare(_a, _b) == 0; 
} 

}