From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 07:55:46 +0300
Message-ID: <20170714045546.GV1528@mtr-leonro.local>
References: <20170714111437.69a6b100@canb.auug.org.au>
 <1499995033.2936.12.camel@redhat.com>
 <20170714033416.GS1528@mtr-leonro.local>
 <20170714135018.5c849c1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dvv5THrRrdqidt0E"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751387AbdGNEzu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 Jul 2017 00:55:50 -0400
Content-Disposition: inline
In-Reply-To: <20170714135018.5c849c1c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>


--dvv5THrRrdqidt0E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 14, 2017 at 01:50:26PM +1000, Stephen Rothwell wrote:
> Hi all,
>
> On Fri, 14 Jul 2017 06:34:16 +0300 Leon Romanovsky <leon@kernel.org> wrote:
> >
> > Sorry Doug, but it is not expected at all for the code which will go to 4.14.
> >
> > Both patches in question were targeted for 4.13 and you was expected to
> > see the merge conflicts during last month or so, prior to merge window of 4.13.
> >
> > In 4.14, you should base your tree on Linus's tree and don't have ANY
> > conflicts in your subsystem, between ANY subsystems and especially
> > Linus, so we will be able to develop and test.
> >
> > For me, this merge conflict puts a large sign, that your tree is not ready for 4.14.
> >
> > Please base your tree on Linus's tree.
>
> And if these commits are destined for v4.14, then they should not have
> been in linux-next yet.

See, this announcement,
http://marc.info/?l=linux-rdma&m=149980130008834&w=2

Thanks

>
> --
> Cheers,
> Stephen Rothwell

--dvv5THrRrdqidt0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlloTtIACgkQ5GN7iDZy
WKd7dA//c2zgj7f24YMrmJDIm0IqTtDF4UwWpIrgFShWqfDMiutSBFgtLGgMQ2Go
HldMBDsHHinMOoh5uuz38WifRCeypznzddX6L8t24CfYLZqtC/J/4/Y4XDAAvt3b
MHxZmZpeK5VgJs0XbxHERe4yn6ccUNmBWH1VttnvU8zy8uewZIVri+tbcE/l6jfa
ERmZi5xx21cbZy0JbQZzkdvO4cqNqO+3ZmmjBUKQIqNrIJIb7qDH9MvkFNasPMcJ
2ICaltdKpJeKtFM3o44obi4w6I1Oeo1073LBvOHFqW5wv5TlpWhCEF/Um1xYouNE
mpft5yIzlKXI3CHH8DwDR+WbwAjLtX0KB+XmwGEH8YeEQbdoAm5cXD9bkiXbfxxV
LsVajbEXiJKuNsUrK9L9M9KQSrpw6wra7dH0DLSsUTphPApQagr9K4eaQqQ3rFa7
7TGklUMcPofgSzzG4qBtW6utEloKAAjSk/bMBnkGJZflywhtf+grphPf9LrlU+pD
CZ2BGuskFNfw3I4C/wlKJDjLTh20HocISONIJXwukm7ljcpKmEK7NiD//Gks9NCy
VGP1LrMRn9inonE5z2uzgqtXAOuzTVcES3MElwNOPWqhrTbrMAq7P1WPXAneJTEM
cQAPAELW/YTSM/O7mHeYyOWrlLXV4oi9BsrCJN0whHTV0EOTmdY=
=hQLg
-----END PGP SIGNATURE-----

--dvv5THrRrdqidt0E--
