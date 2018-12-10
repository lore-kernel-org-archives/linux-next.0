From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Mon, 10 Dec 2018 11:48:48 +1100
Message-ID: <20181210114848.3f726482@canb.auug.org.au>
References: <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
        <20181209214907.GC21186@lunn.ch>
        <20181209232722.GA4425@bistromath.localdomain>
        <20181209.163152.1641648923109797638.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bB1V6PnovWIlxnY4IgzmlMz"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181209.163152.1641648923109797638.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sd@queasysnail.net, andrew@lunn.ch, hkallweit1@gmail.com, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

--Sig_/bB1V6PnovWIlxnY4IgzmlMz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 09 Dec 2018 16:31:52 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Sabrina Dubroca <sd@queasysnail.net>
> Date: Mon, 10 Dec 2018 00:27:22 +0100
>=20
> > Maybe Stephen's script to detect those missing sign-offs could be run
> > as a commit/apply hook by David? This happens regularly, sometimes
> > dropping more than just a sign-off. =20
>=20
> Yeah, that would probably be a good idea, maybe something even on the
> git.kernel.org side that won't let me push if I'm sending commits that
> have this problem.

That is fine as a last resort, but it is probably less disruptive to
find these things before you try to push i.e. as part of the "apply the
patch" otherwise you could end up having to rebase a whole lot of later
commits.

Anyway, here's my current version of my script.  It just takes a commit
range (anything you can pass to "git log").  You may want to drop the
gitk invocation at the end.

--------------------------------------------------------------------
#!/bin/bash

if [ "$#" -lt 1 ]; then
	printf "Usage: %s <commit range>\n", "$0" 1>&2
	exit 1
fi

commits=3D$(git rev-list --no-merges "$@")
if [ -z "$commits" ]; then
	printf "No commits\n"
	exit 0
fi

author_missing=3D
committer_missing=3D

print_commits()
{
	local t=3D"$1"

	shift

	s=3D
	is=3D'is'
	its=3D'its'
	[ "$#" -gt 1 ] && {
		s=3D's'
		is=3D'are'
		its=3D'their'
	}
	printf "Commit%s\n\n" "$s"
	git log --no-walk --pretty=3D'format:  %h ("%s")' "$@"
	printf "\n%s missing a Signed-off-by from %s %s%s.\n" "$is" "$its" "$t" "$=
s"
	printf "\n"
}

for c in $commits; do
	ae=3D$(git log -1 --format=3D'<%ae>%n<%aE>%n %an %n %aN ' "$c" | sort -u)
	ce=3D$(git log -1 --format=3D'<%ce>%n<%cE>%n %cn %n %cN ' "$c" | sort -u)
	msg=3D$(git log -1 --format=3D'%b' "$c")
	sob=3D$(echo "$msg" | sed -En 's/^\s*Signed-off-by:?\s*/ /ip')

	am=3Dfalse
	cm=3Dfalse
	grep -i -F -q "$ae" <<<"$sob" ||
		am=3Dtrue
	grep -i -F -q "$ce" <<<"$sob" ||
		cm=3Dtrue
	"$am" && author_missing+=3D" $c"
	"$cm" && committer_missing+=3D" $c"
done

if [ "$author_missing" ]; then
	print_commits "author" $author_missing
fi
if [ "$committer_missing" ]; then
	print_commits "committer" $committer_missing
fi

exec gitk "$@"
--------------------------------------------------------------------

--=20
Cheers,
Stephen Rothwell

--Sig_/bB1V6PnovWIlxnY4IgzmlMz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwNt/AACgkQAVBC80lX
0GxHFwf/QChML+9/26RJSk5MYZiCdZ2C0Rj0Lq95hdPgnSw6OnVPFbOIjhrZpYwo
rpkbbrju7ZgSMvmgl0BV+nJoUDmgkHfIu6HP6zwtZUhFt9BDWifDNOnHN2MYg2Q2
kVPUnfKv8r2+o7cyZZw3NwcS4PN5a0VW8ygEOFOEvxe3pu8m0tLlIBDcf2DjnixZ
8Muucn91s/5SioTtV4zpaYh6PCDeOrs1o2HWM4vL6u3N80h9lOwG6zfsDyryW+C2
LGhVUq9WDKvIZ+rUq7ykJJ/W8GpSu7F+lWZavruqcIdVYV4taAY5E3N/V4eB4QbA
UEp/J0Xtigx3jbpMaq+VVCeH2eA3ag==
=Idhg
-----END PGP SIGNATURE-----

--Sig_/bB1V6PnovWIlxnY4IgzmlMz--
