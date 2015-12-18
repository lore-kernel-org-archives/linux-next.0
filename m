From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: rebase of the drm-panel tree
Date: Fri, 18 Dec 2015 07:44:31 +0100
Message-ID: <20151218064431.GA8769@ulmo>
References: <20151218091729.1e923834@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151218091729.1e923834@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2015 at 09:17:29AM +1100, Stephen Rothwell wrote:
> Hi Thierry,
>=20
> I noticed that you have rebased the drm-panel tree today.  Unfortunately,
> Dave merged the previous version of your tree :-(

And I had hoped to have been fast enough. Sorry for the mess.

> So, now in linux-next today, we are going to have 2 copies of all theose
> patches, plus at least 2 of the patches have beenm changed in you new
> version so there will probably be conflicts.

Yes, there were two changes (in two patches) which moved device tree
bindings from a deprecated location to the new one.

> Please either go back to the old version, or just rebase what you have
> now on top of Dave's drm tree.

I'll revert to the old version and apply the changes as a separate patch
on top.

Again, sorry for the inconvenience.

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWc6tMAAoJEN0jrNd/PrOhuH8P/A82UWgaR/v2Kb9HxmbAw4Vk
1UKoPk/1VEZaVSig+Md0uZct755SlQAgDDLFWmSKduMZY+7ZyOblmbjo2qbUFob9
ZKVmpLMb/66T+5hR8V6WtcT6gM9PnpziICTLT0+49GwFJbbCCnE9ghqPLR4oetRs
G3Kqm+AGkFaj4YXQquUA2mkTn2Bc0tge/h6nKnDc8NUW8+eg+GNLUJ00syImyfUU
pG2HrzqJb2cfOEeqcX2J7x3SeErdLb+NjXVB0cXhoJBuKnMI7oLJ6qvuh8D3PuqU
kIuJ5nJgoNGsvw3DXGEgxbYJusWxvMoR8aLZSJdgIMwWmRFP0nhIP6YGmjyygW6y
RfSoh18uoxzxueQPGDcoZ/hTnUAHXcdZkIijuib6mMx6Zo6jbfZkt6bavVvj6kJi
5QwSLlX7zhjs25S8lbURJb8y0ottiZDuxBtcimdXcP9i7ikohI0ZM3pB5uVpNP16
hk8lTJVNSvmJLPabos/zaEUKXqI73EPYXOX0b9lzuU6ARkrEDM4Gg7nFkNb+f9fk
8oZsFiOW5OHWDtj9wQr0YVYPoz0R7OwL8C0CixSJMhno1TAaTORjFlIQp+Ksje6G
2uiK5PWjyXS8AYBSBR/PESUzgVqDVmI6gv226af8pX4XdV4TQSke0IA4Pq9kI1WC
DOpKS0Uzi8J9fusSFXGP
=b+GV
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
