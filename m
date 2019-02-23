From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Sun, 24 Feb 2019 09:56:42 +1100
Message-ID: <20190224095642.523fdea2@canb.auug.org.au>
References: <20190224011925.6db87446@canb.auug.org.au>
        <20190223175207.GC4722@wrath>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KZhyBNQ/hZFVW+d997iRVY2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223175207.GC4722@wrath>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/KZhyBNQ/hZFVW+d997iRVY2
Content-Type: multipart/mixed; boundary="MP_/0H667QLdNnEQjQ8aWJ5J6DA"

--MP_/0H667QLdNnEQjQ8aWJ5J6DA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Darren,

On Sat, 23 Feb 2019 09:52:07 -0800 Darren Hart <dvhart@infradead.org> wrote:
>
> Apologies if I've asked you this before... I didn't find it after some
> searching.
>=20
> We should be catching errors like this before they hit next. First,
> there is no reason we can't catch them - unlike the integration failures
> only next can catch. Second, once they are in next, there is no "right"
> way to fix them.  Either rebase or send the bad patch to mainline - both
> are bad. Don't get me wrong, I'm glad next catches them.... but I'd like
> to get to the point where it doesn't trigger on our subsystem :-)
>=20
> Are your patch mechanics tests available for us to integrate into our
> commit and prepublication checks?

I have attached the current version of my check scripts (I can't use
git hooks since I want to do these checks when I fetch trees).  They
both take a range of commits (I usually pass "^origin/master <old SHA
for branch>...<new SHA for branch>" (only 2 dots if the branch is just
fast forwarded).

These could obviously be simplified because they also generate most of
the appropriate mail messages ...
--=20
Cheers,
Stephen Rothwell

--MP_/0H667QLdNnEQjQ8aWJ5J6DA
Content-Type: application/x-shellscript
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=check_fixes

#!/bin/bash

if [ "$#" -lt 1 ]; then
        printf 'Usage: %s <commit range>\n', "$0" 1>&2
        exit 1
fi

commits=3D$(git rev-list --no-merges -i --grep=3D'^[[:space:]]*Fixes:' "$@")
if [ -z "$commits" ]; then
        exit 0
fi

# This should be a git tree that contains *only* Linus' tree
Linus_tree=3D"${HOME}/kernels/linus.git"

split_re=3D'^([Cc][Oo][Mm][Mm][Ii][Tt])?[[:space:]]*([[:xdigit:]]{5,})([[:s=
pace:]]*)(.*)$'
nl=3D$'\n'
tab=3D$'\t'

# Strip the leading and training spaces from a string
strip_spaces()
{
	[[ "$1" =3D~ ^[[:space:]]*(.*[^[:space:]])[[:space:]]*$ ]]
	echo "${BASH_REMATCH[1]}"
}

for c in $commits; do

	commit_log=3D$(git log -1 --format=3D'%h ("%s")' "$c")
	commit_msg=3D"In commit

  $commit_log

"

	fixes_lines=3D$(git log -1 --format=3D'%B' "$c" |
			grep -i '^[[:space:]]*Fixes:')

	while read -r fline; do
		[[ "$fline" =3D~ ^[[:space:]]*[Ff][Ii][Xx][Ee][Ss]:[[:space:]]*(.*)$ ]]
		f=3D"${BASH_REMATCH[1]}"
		fixes_msg=3D"Fixes tag

  $fline

has these problem(s):

"
		sha=3D
		subject=3D
		msg=3D
		if [[ "$f" =3D~ $split_re ]]; then
			first=3D"${BASH_REMATCH[1]}"
			sha=3D"${BASH_REMATCH[2]}"
			spaces=3D"${BASH_REMATCH[3]}"
			subject=3D"${BASH_REMATCH[4]}"
			if [ "$first" ]; then
				msg=3D"${msg:+${msg}${nl}}  - leading word '$first' unexpected"
			fi
			if [ -z "$subject" ]; then
				msg=3D"${msg:+${msg}${nl}}  - missing subject"
			elif [ -z "$spaces" ]; then
				msg=3D"${msg:+${msg}${nl}}  - missing space between the SHA1 and the su=
bject"
			fi
		else
			printf '%s%s  - %s\n' "$commit_msg" "$fixes_msg" 'No SHA1 recognised'
			commit_msg=3D''
			continue
		fi
		if ! git rev-parse -q --verify "$sha" >/dev/null; then
			printf '%s%s  - %s\n' "$commit_msg" "$fixes_msg" 'Target SHA1 does not e=
xist'
			commit_msg=3D''
			continue
		fi

		if [ "${#sha}" -lt 12 ]; then
			msg=3D"${msg:+${msg}${nl}}  - SHA1 should be at least 12 digits long${nl=
}    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11$=
{nl}    or later) just making sure it is not set (or set to \"auto\")."
		fi
		# reduce the subject to the part between () if there
		if [[ "$subject" =3D~ ^\((.*)\) ]]; then
			subject=3D"${BASH_REMATCH[1]}"
		elif [[ "$subject" =3D~ ^\((.*) ]]; then
			subject=3D"${BASH_REMATCH[1]}"
			msg=3D"${msg:+${msg}${nl}}  - Subject has leading but no trailing parent=
heses"
		fi

		# strip matching quotes at the start and end of the subject
		# the unicode characters in the classes are
		# U+201C LEFT DOUBLE QUOTATION MARK
		# U+201D RIGHT DOUBLE QUOTATION MARK
		# U+2018 LEFT SINGLE QUOTATION MARK
		# U+2019 RIGHT SINGLE QUOTATION MARK
		re1=3D$'^[\"\u201C](.*)[\"\u201D]$'
		re2=3D$'^[\'\u2018](.*)[\'\u2019]$'
		re3=3D$'^[\"\'\u201C\u2018](.*)$'
		if [[ "$subject" =3D~ $re1 ]]; then
			subject=3D"${BASH_REMATCH[1]}"
		elif [[ "$subject" =3D~ $re2 ]]; then
			subject=3D"${BASH_REMATCH[1]}"
		elif [[ "$subject" =3D~ $re3 ]]; then
			subject=3D"${BASH_REMATCH[1]}"
			msg=3D"${msg:+${msg}${nl}}  - Subject has leading but no trailing quotes"
		fi

		subject=3D$(strip_spaces "$subject")

		target_subject=3D$(git log -1 --format=3D'%s' "$sha")
		target_subject=3D$(strip_spaces "$target_subject")

		# match with ellipses
		case "$subject" in
		*...)	subject=3D"${subject%...}"
			target_subject=3D"${target_subject:0:${#subject}}"
			;;
		...*)	subject=3D"${subject#...}"
			target_subject=3D"${target_subject: -${#subject}}"
			;;
		*\ ...\ *)
			s1=3D"${subject% ... *}"
			s2=3D"${subject#* ... }"
			subject=3D"$s1 $s2"
			t1=3D"${target_subject:0:${#s1}}"
			t2=3D"${target_subject: -${#s2}}"
			target_subject=3D"$t1 $t2"
			;;
		esac
		subject=3D$(strip_spaces "$subject")
		target_subject=3D$(strip_spaces "$target_subject")

		if [ "$subject" !=3D "${target_subject:0:${#subject}}" ]; then
			msg=3D"${msg:+${msg}${nl}}  - Subject does not match target commit subje=
ct${nl}    Just use${nl}${tab}git log -1 --format=3D'Fixes: %h ("%s")'"
		fi
		lsha=3D$(cd "$Linus_tree" && git rev-parse -q --verify "$sha")
		if [ -z "$lsha" ]; then
			count=3D$(git rev-list --count "$sha".."$c")
			if [ "$count" -eq 0 ]; then
				msg=3D"${msg:+${msg}${nl}}  - Target is not an ancestor of this commit"
			fi
		fi
		if [ "$msg" ]; then
			printf '%s%s%s\n' "$commit_msg" "$fixes_msg" "$msg"
			commit_msg=3D''
		fi
	done <<< "$fixes_lines"
done

exit 0

--MP_/0H667QLdNnEQjQ8aWJ5J6DA
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

--MP_/0H667QLdNnEQjQ8aWJ5J6DA--

--Sig_/KZhyBNQ/hZFVW+d997iRVY2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxxz6oACgkQAVBC80lX
0GzVhQf9EblIScdRfVoaSUuM3G2+o5a6sSy85QwWrwbEbp2fsAE4Pumrfb8GGHsa
RQwFQvOLUcfCczXHphpjhcSZBhd4I7VlBqdyiOOeiIeoow2CQp8kzGyqAzMYQyIB
nldbwUg9z8UX0WPsnYw0Vrcak6G98MRJOunB4+5Rv3lwhG60IKwdgqnt+C7thpfu
I9bMuIrAG10ac+RFSWMiG3FqDctbL1DbKVSkx5gRE5XnZkcPoGF+jyRxvZCLOpwO
Vtpoxgwj68VgCJRKwW7cc6ffKIC6cdu3xrNnBPYpjc+60CWSkgPED24kkKf1DcZ2
HqxKeZ/+jfWy9EbfB/LHgLZ7YCgphA==
=qbN8
-----END PGP SIGNATURE-----

--Sig_/KZhyBNQ/hZFVW+d997iRVY2--
