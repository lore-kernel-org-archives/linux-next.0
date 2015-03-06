From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the virtio tree
Date: Fri, 6 Mar 2015 14:36:20 +1100
Message-ID: <20150306143620.664bf043@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Co_w+0/odpm6QbxWIiJAlCc"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51313 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751483AbbCFDg0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2015 22:36:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/Co_w+0/odpm6QbxWIiJAlCc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in
drivers/virtio/virtio_balloon.c between commit 7f8998200dcb
("virtio_balloon: annotate possible sleep waiting for event") from the
virtio tree and commit 2426d3b03d07 ("virtio-balloon: do not call
blocking ops when !TASK_RUNNING") from the vhost tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/virtio/virtio_balloon.c
index 06001ca71ea3,5a6ad6dbdec4..000000000000
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@@ -341,19 -343,17 +343,25 @@@ static int balloon(void *_vballoon
 =20
  		try_to_freeze();
 =20
 +		/*
 +		 * Reading the config on the ccw backend involves an
 +		 * allocation, so we may actually sleep and have an
 +		 * extra iteration.  It's extremely unlikely, and this
 +		 * isn't a fast path in any sense.
 +		 */
 +		sched_annotate_sleep();
 +
- 		wait_event_interruptible(vb->config_change,
- 					 (diff =3D towards_target(vb)) !=3D 0
- 					 || vb->need_stats_update
- 					 || kthread_should_stop()
- 					 || freezing(current));
+ 		add_wait_queue(&vb->config_change, &wait);
+ 		for (;;) {
+ 			if ((diff =3D towards_target(vb)) !=3D 0 ||
+ 			    vb->need_stats_update ||
+ 			    kthread_should_stop() ||
+ 			    freezing(current))
+ 				break;
+ 			wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
+ 		}
+ 		remove_wait_queue(&vb->config_change, &wait);
+=20
  		if (vb->need_stats_update)
  			stats_handle_request(vb);
  		if (diff > 0)

--Sig_/Co_w+0/odpm6QbxWIiJAlCc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU+SC4AAoJEMDTa8Ir7ZwVImwP/iHEEGHw8tPUVuga3lw4IWC0
Vk+KwYaAiOLI1oDVL7dK38BYo97gduV2lutQ6zIb8nUrAQy31W8txA9eZ0SqWETE
5A8JYTrJ41HQGw954rg3mEkzscGbiHTlzx0fpNfvd6NnecCyzKKtMRQAuRJKtria
JHo0eGgX6adql72IJZ5r1OXbGF9IM13IwbnefJzbCR0VwCxXItUx+nUkGEiaGIk0
sGaU4DSAvNXUbdXpXc7v2OHFhd/4kEjL0Tj5WeesiXSZdJUA4JvzDHkF2EehPBQX
rJy/V08HrdQCQGtKS+cR7LTc5gRbury/I8JFGUJamnjj6BIMJ0exTogRMVtIn7Fb
obMqXNqi6a9/GpxNQxtGGHmQMAW0y1zcs1wJ+PSNbnARiiFqido1N+7QZpM4bEIi
YzLnshyf4q75ubmx1ET6VpV+yORIYiRA+SNxRYBOwHtUaylgbvr3pH53ug1MVoU/
C4RZHHUuaOayq/Gi2SnE65yEwK7Mc/qlMOHYxArB5uMQObsbNI15tbEGXE5D9sK/
8/8zVJRmd3L1Hvddo3/bbUO9d5gn0Mgn3E795mRJ4uENeD/cO1Vj/CXmrhPcv5op
v9m+xDrRbj2CmXA6jCRPnlRMnlV2X7wyfVOKZMbQGtiR5mRW21/17PCJcBJ69DOz
C+eDvd9UHFXmP4cpRon5
=upGE
-----END PGP SIGNATURE-----

--Sig_/Co_w+0/odpm6QbxWIiJAlCc--
