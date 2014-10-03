From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: build failure after merge of the target-updates tree
Date: Fri, 03 Oct 2014 01:10:27 -0700
Message-ID: <1412323827.6015.10.camel@haakon3.risingtidesystems.com>
References: <20141003154629.3b64e021@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141003154629.3b64e021@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 2014-10-03 at 15:46 +1000, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> After merging the target-updates tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/target/target_core_user.c: In function 'tcmu_netlink_event':
> drivers/target/target_core_user.c:780:2: error: expected ';' before 'ret'
>   ret = nla_put_u32(skb, TCMU_ATTR_MINOR, minor);
>   ^
> 
> Caused by commit 7f2ea21b2c8d ("target/user: Fix up smatch warnings in
> tcmu_netlink_event").
> 
> I have reverted that commit for today.

Fixed.  Thank you Stephen.

--nab
