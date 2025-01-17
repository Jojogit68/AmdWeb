<!DOCTYPE html>
<html lang="fr-FR">

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	{block name="head_infos"}
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
	<link rel="stylesheet" href="assets/css/style.css" />
	{/block}

	<title>{$strTitle}</title>
</head>

<body>
	<div class="wrapper">
		<!--Header navigation-->
		<div class="wrap-header">
			<header class="color-style">
				<div class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<a class="navbar-brand" href="index.php">
							<div class="logo-box">
								<img src="assets/images/img_first_page/logo.png" alt="logo" />
							</div>
						</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<nav class="collapse navbar-collapse color-style" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item">
									<a class="nav-link {if ($strPage == "index")} active {/if}" href="index.php">Accueil</a>
								</li>
								<li class="nav-item">
									<a class="nav-link {if ($strPage == "emploi")} active {/if}" href="index.php?ctrl=offre&action=afficherOffres">Emploi</a>
								</li>
								<li class="nav-item">
									<a class="nav-link {if ($strPage == "galerie")} active {/if}" href="index.php?ctrl=page&action=galerie">Galerie</a>
								</li>
								<li class="nav-item">
									<a class="nav-link {if ($strPage == "inscription")} active {/if}" href="index.php?ctrl=utilisateur&action=inscription">Inscription</a>
								</li>
								<li class="nav-item">
									<a class="nav-link {if ($strPage == "connexion")} active {/if}" href="index.php?ctrl=utilisateur&action=connexion">Connexion</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>
			<div id="user">
			{if isset($smarty.session.user.utilisateur_id) && $smarty.session.user.utilisateur_id != ''}
			<p class="text-right">Bonjour <a href="index.php?ctrl=utilisateur&action=modifier_compte" title="Modifier son profil">{$smarty.session.user.utilisateur_prenom}</a>
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-primary " data-bs-toggle="modal" data-bs-target="#aideModal">
						Aide
					</button>
				| 
				<a href="index.php?ctrl=utilisateur&action=deconnection" title="Se déconnecter">Se déconnecter</a>
				{if ($smarty.session.user.utilisateur_droit_id == 3)}
				 - 
				<a href="index.php?ctrl=utilisateur&action=list_user" title="Administration">Administration</a> 
				{/if}
				{if ($smarty.session.user.utilisateur_droit_id == 4)}
				|
				<a href="index.php?ctrl=offre&action=afficherOffres" title="Modération">Modération</a> 
				{/if}
				
				
				<!-- Modal -->
				<div class="modal fade" id="aideModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Aide utilisateur</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							{if ($smarty.session.user.utilisateur_droit_id == 4)}
							<div class="modal-body">
								En tant que modérateur vous pouvez :
								<ul>
									<li>Gérer les offres d'emploi</li>
									<li>Gérer les photos</li>
								</ul>
							</div>
							{else if ($smarty.session.user.utilisateur_droit_id == 3)}
							<div class="modal-body">
								En tant qu'administrateur vous pouvez :
								<ul>
									<li>Gérer les offres d'emploi</li>
									<li>Gérer les photos</li>
									<li>Gérer les utilisateurs</li>
								</ul>
							</div>
							{else}
							<div class="modal-body">
								En tant que candidat vous pouvez :
								<ul>
									<li>Consulter les offres d'emploi</li>
									<li>Postuler à une offre</li>
									<li>Ajouter des photos</li>
								</ul>
								En tant que recruteur vous pouvez en plus :
								<ul>
									<li>Déposer des offres d'emploi</li>
								</ul>
							</div>
							{/if}
								<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fermer l'aide</button>
							</div>
						</div>
					</div>
				</div>
				</p>
			{/if}
			</div>

			{* {$smarty.session|var_dump} *}

