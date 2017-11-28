From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging
 tree
Date: Wed, 29 Nov 2017 09:59:16 +1100
Message-ID: <20171129095916.062d6f7d@canb.auug.org.au>
References: <20171128081651.71a2e92a@canb.auug.org.au>
        <20171128194139.GA2653@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/doR0lJ+HwCEyjQO_XgeImZN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752367AbdK1W7S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 17:59:18 -0500
In-Reply-To: <20171128194139.GA2653@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--MP_/doR0lJ+HwCEyjQO_XgeImZN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Greg,

On Tue, 28 Nov 2017 20:41:39 +0100 Greg KH <greg@kroah.com> wrote:
>
> I need to set up a git hook for this :(

I couldn't find an appropriate hook for fetching or merging other
trees :-( Instead I run the attached script below after each fetch.

-- 
Cheers,
Stephen Rothwell

--MP_/doR0lJ+HwCEyjQO_XgeImZN
Content-Type: application/x-shellscript
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=check_commits

#!/bin/bash

if [ "$#" -lt 1 ]; then
	printf "Usage: %s <commit range>\n", "$0" 1>&2
	exit 1
fi

for c in $(git rev-list --no-merges "$@"); do
	ae=$(git log -1 --format='%ae' "$c")
	aE=$(git log -1 --format='%aE' "$c")
	an=$(git log -1 --format='%an' "$c")
	aN=$(git log -1 --format='%aN' "$c")
	ce=$(git log -1 --format='%ce' "$c")
	cE=$(git log -1 --format='%cE' "$c")
	cn=$(git log -1 --format='%cn' "$c")
	cN=$(git log -1 --format='%cN' "$c")
	sob=$(git log -1 --format='%b' "$c" | grep -i '^[[:space:]]*Signed-off-by:')

	am=false
	cm=false
	grep -i -q "<$ae>" <<<"$sob" ||
		grep -i -q "<$aE>" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$an[[:space:]]*<" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$aN[[:space:]]*<" <<<"$sob" ||
		am=true
	grep -i -q "<$ce>" <<<"$sob" ||
		grep -i -q "<$cE>" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$cn[[:space:]]*<" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$cN[[:space:]]*<" <<<"$sob" ||
		cm=true

	if "$am" || "$cm"; then
		printf "Commit %s\n" "$c"
		"$am" && printf "\tauthor SOB missing\n"
		"$cm" && printf "\tcommitter SOB missing\n"
		printf "%s %s\n%s\n" "$ae" "$ce" "$sob"
	fi
done

exec gitk "$@"

--MP_/doR0lJ+HwCEyjQO_XgeImZN--
