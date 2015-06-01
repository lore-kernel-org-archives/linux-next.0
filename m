From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 1 Jun 2015 21:09:43 +1000
Message-ID: <20150601210943.33d57b7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nWT1H3F6PB8cj8GO=/m9uek"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35624 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752045AbbFALJu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 07:09:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Grover <agrover@redhat.com>

--Sig_/nWT1H3F6PB8cj8GO=/m9uek
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/target/target_core_transport.c between commit a3541703ebbf
("target: Use a PASSTHROUGH flag instead of transport_types") from
Linus' tree and commit 50c44f9b1587 ("target: Add support for fabric
IRQ completion") from the target-updates tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/target/target_core_transport.c
index 2b17bddeff0f,a98a23c475b2..000000000000
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@@ -1767,11 -1767,11 +1768,11 @@@ static int target_write_prot_action(str
  			break;
 =20
  		sectors =3D cmd->data_length >> ilog2(cmd->se_dev->dev_attrib.block_siz=
e);
- 		cmd->pi_err =3D sbc_dif_verify_write(cmd, cmd->t_task_lba,
- 						   sectors, 0, NULL, 0);
+ 		cmd->pi_err =3D sbc_dif_verify(cmd, cmd->t_task_lba,
+ 					     sectors, 0, cmd->t_prot_sg, 0);
  		if (unlikely(cmd->pi_err)) {
  			spin_lock_irq(&cmd->t_state_lock);
 -			cmd->transport_state &=3D ~CMD_T_BUSY|CMD_T_SENT;
 +			cmd->transport_state &=3D ~(CMD_T_BUSY|CMD_T_SENT);
  			spin_unlock_irq(&cmd->t_state_lock);
  			transport_generic_request_failure(cmd, cmd->pi_err);
  			return -1;
@@@ -1913,8 -1914,8 +1915,8 @@@ static bool transport_complete_task_att
  {
  	struct se_device *dev =3D cmd->se_dev;
 =20
 -	if (dev->transport->transport_type =3D=3D TRANSPORT_PLUGIN_PHBA_PDEV)
 +	if (dev->transport->transport_flags & TRANSPORT_FLAG_PASSTHROUGH)
- 		return;
+ 		return true;
 =20
  	if (cmd->sam_task_attr =3D=3D TCM_SIMPLE_TAG) {
  		atomic_dec_mb(&dev->simple_cmds);

--Sig_/nWT1H3F6PB8cj8GO=/m9uek
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbD18AAoJEMDTa8Ir7ZwVvpkQAIWME9QUtsD++xEGGL+6Yqki
Mgf+/JfOkHlS0rQ/aWuRHgRU4/avtNZM+XgvykfFKzSb5+vJJuQdIRxn5F0b0dGd
7Zy/rhpgexV2CLtfJoWLwxt5srH0/xAE5jSOTgD5knw5HFrjV8+I5ODV8DtGUurE
yhsmR/e67Xjv0EXbegAyevdAXDHL4HXki2kmAVzZAyCJhMAPJbst3WvRGo5rh0Pe
ONFy6lD9dg07AP/VRlxOM0ykTtX4j2s7y7MAIssUP2451qSpXVv17GgYPI80j8zl
JHTcnm7WXLj0Psr3J/kif/LpRiIf2q79T6fRmocFnFnzN5jSJHzhz0+GvXfiUMzd
jE8N0d2uCEmDAzF1OMiULHIV2tmOPIGWTiXnpEfkXVTOH4uBD3Xc5EZSndF+1gNA
eV5fWWD6X4LXtBT8I53qPAYJ4reEbGluBc+Vzs2/dPOAiRAT1iIs/vRmDvGLWMyp
qnkcedXQbVVXm54xEV1xdLefREhu8eesL2srsQkuT1dE6FdfKQt8D2w84TiLJXST
o9XEQwnVgIzBM+r+CJDi/vK8SP3UoKgOstZ/IRCNZypMsRpQo5O1DvoEnV9BbA3F
7hEGspgDkEhyGz4NdbgdDWrYVr4WjdzU7sqs6h7aWdYyoGYFVDKNT0eZ97MvbWug
i4mhk5ZGUWFRNSZNXF3Z
=6jAt
-----END PGP SIGNATURE-----

--Sig_/nWT1H3F6PB8cj8GO=/m9uek--
