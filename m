From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Date: Thu, 14 Feb 2019 08:17:16 +1100
Message-ID: <20190214081716.1367f024@canb.auug.org.au>
References: <20190213100309.03b5ea58@canb.auug.org.au>
        <CAErSpo5vmvx8QcQoEGzvN+5sWbL1syr2c5hD9AJwW3FGJ=8Hyw@mail.gmail.com>
        <20190214070958.058aaf32@canb.auug.org.au>
        <CAErSpo41bDxfajDJFH1AQK0ZwX=fC2jnay8Y5CyaS0f=+9LOHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PH76b2KzPsXn/xXl=LbMreg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAErSpo41bDxfajDJFH1AQK0ZwX=fC2jnay8Y5CyaS0f=+9LOHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wen Yang <wen.yang99@zte.com.cn>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PH76b2KzPsXn/xXl=LbMreg
Content-Type: multipart/mixed; boundary="MP_/Ckag9eUwX/k/LeRKcpE3w7."

--MP_/Ckag9eUwX/k/LeRKcpE3w7.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Bjorn,

On Wed, 13 Feb 2019 14:19:32 -0600 Bjorn Helgaas <bhelgaas@google.com> wrot=
e:
>
> Thanks, I guess now I have no more excuse :)

:-)

> Is the "missing a Signed-off-by from their committer" thing that I
> regularly trip over a manual check?

Ah, attached is the other script I run (maybe I should combine them).
--=20
Cheers,
Stephen Rothwell

--MP_/Ckag9eUwX/k/LeRKcpE3w7.
Content-Type: application/x-shellscript
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=check_commits

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

--MP_/Ckag9eUwX/k/LeRKcpE3w7.--

--Sig_/PH76b2KzPsXn/xXl=LbMreg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxkiVwACgkQAVBC80lX
0GxHnAgAn0wqCQDaZTTAKXS0uh4RKt4K+8EFvWHTku2hhvUXsbP2ZKTBcWWj71T+
sdu4+Gb5AgNXCUagRL3ujNwQKXosfQ0XhKVr9PlC0mh9zzodX/p5Wl63ECQRrJkI
0wiT1gyQMVgmSIpge1Q3iC24fCUbAaL+bQslxYk1Lkg+ka20sFax4ji2+7yn4Cks
sJHAm+SrfsamfhK3plTivebLHZe7Ifw6RpCUykRVn7WoilP1khBHl7MXzzo0bS59
5/opDSbEDf8MWYuWn49BgMO2GLy2Jy44DfRP5TqtrZxUDMu6GZvTerd7uAUqUtKq
p9v9r3lHVNUyhSpLLXVfkFvHkcfdTw==
=10xJ
-----END PGP SIGNATURE-----

--Sig_/PH76b2KzPsXn/xXl=LbMreg--
