unit Frames.CreateGame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.EditBox, FMX.SpinBox
, DataModel, System.Actions, FMX.ActnList;

type
  TCreateGameFrame = class(TFrame)
    NameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LangComboBox: TComboBox;
    Label3: TLabel;
    MinUsersSpinBox: TSpinBox;
    Label4: TLabel;
    Label5: TLabel;
    MaxUsersSpinBox: TSpinBox;
    IsPrivateCheckBox: TCheckBox;
    Label6: TLabel;
    YourNameEdit: TEdit;
    CreateButton: TButton;
    CancelButton: TButton;
    ActionList1: TActionList;
    CreateGameAction: TAction;
    procedure CreateGameActionExecute(Sender: TObject);
    procedure CreateGameActionUpdate(Sender: TObject);
    procedure MinUsersSpinBoxChange(Sender: TObject);
    procedure MaxUsersSpinBoxChange(Sender: TObject);
  private
    function GetMaxUsers: Integer;
    function GetMinUsers: Integer;
    procedure SetMaxUsers(const Value: Integer);
    procedure SetMinUsers(const Value: Integer);
    { Private declarations }

    property MinUsers: Integer read GetMinUsers write SetMinUsers;
    property MaxUsers: Integer read GetMaxUsers write SetMaxUsers;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses
  datamodel.standard;


procedure TCreateGameFrame.CreateGameActionExecute(Sender: TObject);
var
  LGameData: IGameData;
begin
  LGameData := TGameData.Create(NameEdit.Text, LangComboBox.Selected.Text, IsPrivateCheckBox.IsChecked);
  LGameData.MinUser := MinUsers;
  LGameData.MaxUser := MaxUsers;
end;

procedure TCreateGameFrame.CreateGameActionUpdate(Sender: TObject);
begin
  CreateGameAction.Enabled :=
      (NameEdit.Text.Length > 3)
  and (YourNameEdit.Text.Length > 3)
  and (MaxUsers >= MinUsers);
end;

function TCreateGameFrame.GetMaxUsers: Integer;
begin
  Result := Trunc(MaxUsersSpinBox.Value);
end;

function TCreateGameFrame.GetMinUsers: Integer;
begin
  Result := Trunc(MinUsersSpinBox.Value);
end;

procedure TCreateGameFrame.MaxUsersSpinBoxChange(Sender: TObject);
begin
  if MaxUsers < MinUsers then
    MinUsers := MaxUsers;
end;

procedure TCreateGameFrame.MinUsersSpinBoxChange(Sender: TObject);
begin
  if MinUsers > MaxUsers then
    MaxUsers := MinUsers;
end;

procedure TCreateGameFrame.SetMaxUsers(const Value: Integer);
begin
  MaxUsersSpinBox.Value := Value;
end;

procedure TCreateGameFrame.SetMinUsers(const Value: Integer);
begin
  MinUsersSpinBox.Value := Value;
end;

end.