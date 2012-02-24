From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Fri, 24 Feb 2012 14:47:05 +1100
Message-ID: <20120224144705.3be6f9367c92340653bafe71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__24_Feb_2012_14_47_05_+1100_DrfBf6uMoumnx3Yu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:53418 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754719Ab2BXDrV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2012 22:47:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

--Signature=_Fri__24_Feb_2012_14_47_05_+1100_DrfBf6uMoumnx3Yu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/staging/android/binder.c: In function 'task_get_unused_fd_flags':
drivers/staging/android/binder.c:383:39: error: request for member 'fds_bit=
s' in something not a structure or union

Caused by commit 1fd36adcd98c ("Replace the fd_sets in struct fdtable
with an array of unsigned longs").

I have used the tip tree from next-20120223 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__24_Feb_2012_14_47_05_+1100_DrfBf6uMoumnx3Yu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPRwg5AAoJEECxmPOUX5FEgAAQAIe3NgctIWM7ZYhf4n1TrsSe
4EllR3diI+2xCQPTrp+ubiRSOHblJQY4s7em+2xsvhfmlH1LTOEcj7tn1bo03NoS
argD1y9wkRBMWRfXHSQGvTedKGOTf11TYP+QqcQjXfREs97ragGrdBtjtTaEotSF
7dxagvJrfcUlarAz5oS1/1v8fVKSu5XMX7ZyZwfY65lsg03PDyI4Z739n2jGbgYj
A2MAm6eiST/FbV3JVBGgkafmLCqSOxLGLJv7xy1ve4/Ocaoqf8+GCSnrva85QN3P
0+TOciEt85HL1Q5+aq+SguN8wNcFfbtvlb6MC5w3jkDSfRHWiaB2KgKxh5/wzVSC
gctxwLjv3xAHWvr7g4EEZokTGgTkYNBlpfM8foOFm7ROsOnWjZbpaNSJaYcxrKJM
5y0nR0PvoPYUwWS9OZNRBTRFuBWjRtO4AHdhPohwZMBfojA/jD8TDMlm/JMlXm//
m8wCN9or0j56upmodMy2iDMssKpES7AQQxbWBsA9NzMZyeLcLtMeWvorAVkP7CM6
Gjy6oQzW7WrAboWLGYqpcbZgX0xMNm0qsWu5KCtkGiWYXrSoC8TkergiGEwaNMxv
lUkDxUcFw5Bj1ZgSgSQgjE+2rS3Bd6UXp0X2LPV9jLd5V2XGhrIhqAtE2d/4mP0n
xV9cUfDHWBqE2VZF0pBO
=ZW8Z
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Feb_2012_14_47_05_+1100_DrfBf6uMoumnx3Yu--
