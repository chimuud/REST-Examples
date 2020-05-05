unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.StdCtrls,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, System.JSON;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  jv: TJSONValue;
begin
  RESTRequest1.Params.Clear;
  RESTRequest1.Params.AddItem('pattern', Edit1.Text);

  //A RAD Server resource is an extension of the RAD Server Engine (EMS Server) API.
  //When you load a RAD Server resource into the RAD Server Engine,
  //the RAD Server Engine registers it and exposes all its endpoints.
  //RAD Server client applications can use a TBackendEndpoint component
  //to access the endpoints of your RAD Server resource.
  //
  //If you are accessing an EMS resource, the Resource property must contain
  //the resource name of the target resource.
  RESTRequest1.Resource := 'songs.json';
  try
    RESTRequest1.Execute;
    jv := RESTResponse1.JSONValue;
    Memo1.Text := jv.Format(2);
  except
    on e: Exception do
      ShowMessage('Some error: ' + e.Message);
  end;
end;

end.
