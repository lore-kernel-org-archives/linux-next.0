From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: linux-next: manual merge of the net tree
Date: Mon, 1 Dec 2008 12:06:07 -0500
Message-ID: <200812011206.09129.vapier@gentoo.org>
References: <20081201142623.5c38680b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2283615.kZoLHvUcPK";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:40614 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751585AbYLARGK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 12:06:10 -0500
In-Reply-To: <20081201142623.5c38680b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Al Viro <viro@ftp.linux.org.uk>, Jeff Garzik <jgarzik@redhat.com>

--nextPart2283615.kZoLHvUcPK
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 30 November 2008 22:26:23 Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/smc91x.c between commit
> f57628d76bd201a444ca822f3622522a44acbf60 ("section errors in
> smc911x/smc91x") from Linus' tree and commit smc_drv_probe ("smc91x: add
> __init markings to smc_drv_probe()") from the net tree.
>
> The former changed smc_drv_probe() to __devinit while the latter to
> __init.  I used the latter and it can be fixed up in your tree.
>
> I do wonder why the former change didn't go through Jeff's tree ...

__devinit is correct ... it's a probe function
-mike

--nextPart2283615.kZoLHvUcPK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJNBmAAAoJEEFjO5/oN/WBIU8P+gMs9E+hopmfN5d0L3N9CgWk
Qgnw6/0qNmOi+wqzLS+kKjeSp3uanJlQYMV7glFbWvlq2lMGxwj/lSlOhFbK6TS0
4duwuo61tWo6LVhuZzAobso2auRJA8wcFZaqEQCq/+apRSiUpBqBunisy4eW2HkQ
JyQZaFTbd1JVx7x9+J6DD3bheryK3U2o2uLVOzKOPBD0WkdgKHVFWmwbyhBawmDq
Dr5rD63ebmdOAyUov5R36K+13LTgnRhnbLV7d66WXccx+C3VTt29awWvSd3/QzXL
pHSIIyvT5ShnHdDrzY53/B606ZSyhPGi4KzskFD26K4CTkRFzl59tpeRBTZ702Fp
onCjeU62m5R6W90sLCf8Op+JLZVhRslctmY27rvsy8s59bJVmwBzFzPPJQZVeyt9
Tcs9AC2HMSy5tfZ56G757IFbv699pfvl+asVNhl1IOQb8SWXzZETlCaGgP58BkEq
8fEHUR5e7R6E32hZsgjW9TrJSaXJJv5iVdzEOkHjplrixB44wG5wf6MYGPlJ5JTz
/igl0UH6J1+vGD7c8l1sRAq1+I+8nsOZEgd66N0eMNNW4oQg3rcXpr8Au8zIzfoo
QH7/Zfu4raekkxpsqtM+hLgeY7L6JVB/YHHcpn4W0twOR5uHQ6sprd/IOkcbGqtY
kX+Ahpwf+6fmq3B55CxY
=PK1p
-----END PGP SIGNATURE-----

--nextPart2283615.kZoLHvUcPK--
