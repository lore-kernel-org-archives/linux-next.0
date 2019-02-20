From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 20 Feb 2019 20:59:10 +0100
Message-ID: <20190220205910.7bd7fd40@redhat.com>
References: <20190220044055.GD21884@vkoul-mobl>
        <20190219.224813.723564128666927693.davem@davemloft.net>
        <20190220083611.GJ3080@nanopsycho>
        <20190220.110201.2245447687492293995.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220.110201.2245447687492293995.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: jiri@resnulli.us, vkoul@kernel.org, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch
List-Id: linux-next.vger.kernel.org

On Wed, 20 Feb 2019 11:02:01 -0800 (PST)
David Miller <davem@davemloft.net> wrote:

> From: Jiri Pirko <jiri@resnulli.us>
> Date: Wed, 20 Feb 2019 09:36:11 +0100
> 
> > Would be good to have some robot checking "Fixes" sanity...  
> 
> I want to add a script to my trees that locally do it for me but the
> backlog for patch review for me is so huge that I never get to "fun"
> tasks like that....

If it helps, this is what I use after being bitten once:

#!/bin/sh

[ ${#} -ne 2 ] && echo "Usage: %0 PATCH_FILE GIT_TREE" && exit 1
grep "^Fixes: " "${1}" | while read -r f; do
	sha="$(echo "${f}" | cut -d' ' -f2)"
	if [ -z "${sha}" ] || [ "${f}" != "$(git -C "${2}" show -s --abbrev=12 --pretty=format:"Fixes: %h (\"%s\")" "${sha}" 2>/dev/null)" ]; then
		echo "Bad tag: ${f}" && exit 1
	fi
done

-- 
Stefano
