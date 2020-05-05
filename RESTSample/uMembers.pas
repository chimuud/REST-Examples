unit uMembers;

interface

uses
  Web.HTTPApp, System.SysUtils, System.Classes,
  uSQLUtils; //located in Database-Access

type
  TMembers = class(TSQLHelper)
  private
    FId: Integer;
    FLastName: string;
    FMiddleName: string;
    FFirstName: string;
    FAge: byte;

    function GetId: Integer;
    function GetFirstName: string;
    function GetLastName: string;
    function GetMiddleName: string;
    function GetAge: byte;
    function ToJSON: string;
  public
    property Id: Integer read GetId write FId;
    property FirstName: string read GetFirstName write FFirstName;
    property MiddleName: string read GetMiddleName write FMiddleName;
    property LastName: string read GetLastName write FLastName;
    property Age: byte read GetAge write FAge;
    function GetMember(Id: Integer): string;
  end;

implementation

uses
  JSON;

{ TFamily }

{ *** Properties ***}

function TMembers.GetAge: byte;
begin
  Result := FAge;
end;

function TMembers.GetFirstName: string;
begin
  Result := FFirstName;
end;

function TMembers.GetId: Integer;
begin
  Result := FId;
end;

function TMembers.GetLastName: string;
begin
  Result := FLastName;
end;

function TMembers.GetMiddleName: string;
begin
  Result := FMiddleName;
end;

{ *** End Properties ***}

function TMembers.ToJSON: string;
var
  o: TJSONObject;
begin
  try
    o := TJSONObject.Create;
    o.AddPair('id', TJSONNumber.Create(Id));
    o.AddPair('FirstName', FirstName);
    o.AddPair('LastName', LAstName);
    o.AddPair('Age', TJSONNumber.Create(Age));
    Result := o.ToJSON;
  finally
    o.Free;
  end;
end;

function TMembers.GetMember(Id: Integer): string;
begin
  Close;
  SQL.Text :=
    'SELECT * FROM Members '+
    'WHERE Id = ' + Id.ToString;

  Open;

  if RecordCount > 0 then
  begin
    FId := FieldByName('Id').AsInteger;
    FirstName := FieldByName('FirstName').AsString;
    MiddleName := FieldByName('MiddleName').AsString;
    LastName := FieldByName('LastName').AsString;
    Age := FieldByName('Age').AsInteger;
  end;

  Result := ToJSON;
end;


end.
