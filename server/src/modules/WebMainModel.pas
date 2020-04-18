unit WebMainModel;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule4 = class(TWebModule)
    procedure WebModule4wactGamesAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  end;

var
  WebModuleClass: TComponentClass = TWebModule4;

implementation
Uses
  Requests
, ViewModel
;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModule4.WebModule4wactGamesAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TGameRequest.HandleRequest( Request, Response, Handled,

    // Create
    procedure(Response: TWebResponse; var Handled: Boolean; const ViewModel: IViewModel)
    begin
      Response.Content := ViewModel.CreateGame( Request.Content );
    end,

    // Read
    procedure(Response: TWebResponse; var Handled: Boolean; const ViewModel: IViewModel)
    begin
      Response.Content := ViewModel.getPublicGames;
    end,

    // Update
    nil,

    // Delete
    nil
  );
end;

end.
