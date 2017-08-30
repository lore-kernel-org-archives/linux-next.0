From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc
 tree
Date: Thu, 31 Aug 2017 03:21:48 +1000
Message-ID: <20170831032148.3d2fa85b@canb.auug.org.au>
References: <20170830230712.55db7911@canb.auug.org.au>
        <20170830131930.bvu6furm7dlhes3i@piout.net>
        <CAOesGMg130BvqS1vGid9jm-G7-Gub+7bOQFKtaSg4qPTvosxcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60677 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751415AbdH3RVv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Aug 2017 13:21:51 -0400
In-Reply-To: <CAOesGMg130BvqS1vGid9jm-G7-Gub+7bOQFKtaSg4qPTvosxcA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Rezvanov <dmitry.rezvanov@yandex.ru>

Hi Olof,

On Wed, 30 Aug 2017 09:21:47 -0700 Olof Johansson <olof@lixom.net> wrote:
>
> Thanks for the heads up, Stephen. I presume you have a script that
> checks this? It's something we should run too, do you keep it in a
> shared location?

Script below.

-- 
Cheers,
Stephen Rothwell

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
