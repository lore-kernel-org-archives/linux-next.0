From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tags need some work in the cifs tree
Date: Tue, 9 Apr 2019 09:54:49 +1000
Message-ID: <20190409095449.72007f57@canb.auug.org.au>
References: <20190409073827.0ac717ab@canb.auug.org.au>
        <CAH2r5mvSQ6+gq92EMtj+_DYCZW_AOjZocJ9rAKHdtU09Nw-pgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/02N7hMTNptn9kLIL_cZCPM0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAH2r5mvSQ6+gq92EMtj+_DYCZW_AOjZocJ9rAKHdtU09Nw-pgw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ZhangXiaoxu <zhangxiaoxu5@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/02N7hMTNptn9kLIL_cZCPM0
Content-Type: multipart/mixed; boundary="MP_/FDNC/8JxdDJ7R5XX5+QpDDK"

--MP_/FDNC/8JxdDJ7R5XX5+QpDDK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Steve,

On Mon, 8 Apr 2019 17:30:20 -0500 Steve French <smfrench@gmail.com> wrote:
>
> I just fixed these up manually and repushed to cifs-2.6.git for-next

Thanks.

> I was curious if checkpatch should have flagged this - I reran
> checkpatch on the original version of Zhang's patches and it didn't
> complain about the spacing (and probably should have).

Yeah, I use the attached script to check for these.  I was hoping that
someone might hack at least some of theses tests into checkpatch, but
that hasn't happened yet :-(  But, then again, I don't run checkpatch :-)
--=20
Cheers,
Stephen Rothwell

--MP_/FDNC/8JxdDJ7R5XX5+QpDDK
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
ct${nl}    Just use${nl}${tab}git log -1 --format=3D'Fixes: %h (\"%s\")'"
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

--MP_/FDNC/8JxdDJ7R5XX5+QpDDK--

--Sig_/02N7hMTNptn9kLIL_cZCPM0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyr30kACgkQAVBC80lX
0GyfzAf/RjpvVMTlE0fWjfEbzfFMPXEC7BFLB/xT0gWuA8OVA0WjEg4J2MXTJopC
2JyneKZn4gqirv9S+cg/pwatb/Lq8zySiWqHChs5ICW3Lj8npr1PH9tmgOWCCNR/
NyVxA2ywmRKNVMJJoypXwdQofvqW2lztSrinrnPx7oJggVIj8ZE1o8po5wtkHdJa
6x2lryMw5aTytlSl7NgfkOlz5V++vKMAzkCkf4890ZBhAu2uYfO9qR8yaZ3ZWsmn
v576OWLBv3z8bFMN+CR3ZN3JDh0TZ6AojUDcGqcQBT9cC8uJcRaWNeWqDiqD4LQK
A3NCYYNRgUB3T4v8uVCeFx8f7w387g==
=9Sl5
-----END PGP SIGNATURE-----

--Sig_/02N7hMTNptn9kLIL_cZCPM0--
