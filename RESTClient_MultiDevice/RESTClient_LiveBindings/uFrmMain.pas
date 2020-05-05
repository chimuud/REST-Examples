unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.StdCtrls, FMX.Edit, Data.Bind.Components,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, REST.Client,
  Data.Bind.ObjectScope, JSON;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    MemoContent: TMemo;
    LinkControlToFieldContent: TLinkControlToField;
    BindingsList1: TBindingsList;
    Panel1: TPanel;
    EditParamspattern: TEdit;
    LabelParamspattern: TLabel;
    Button1: TButton;
    LinkControlToField1: TLinkControlToField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  jValue: TJSONValue;
begin
  RESTRequest1.Execute;
  jValue:=RESTResponse1.JSONValue;
  MemoContent.Text:= jValue.ToString;
end;

end.
