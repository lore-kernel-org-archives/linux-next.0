From: Paul Moore <pmoore@redhat.com>
Subject: Re: linux-next: build warning after merge of the security tree
Date: Tue, 05 Aug 2014 15:49:17 -0400
Message-ID: <2473453.7vHnsXcYFU@sifl>
References: <20140804162549.28c9889d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140804162549.28c9889d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>
List-Id: linux-next.vger.kernel.org

On Monday, August 04, 2014 04:25:49 PM Stephen Rothwell wrote:
> Hi James,
> 
> After merging the security tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from include/net/cipso_ipv4.h:41:0,
>                  from net/ipv4/sysctl_net_ipv4.c:24:
> include/net/netlabel.h:527:12: warning: 'netlbl_catmap_setlong' defined but
> not used [-Wunused-function] static int netlbl_catmap_setlong(struct
> netlbl_lsm_catmap **catmap, ^
> 
> Introduced by commit 4b8feff251da ("netlabel: fix the horribly broken
> catmap functions").

Looks like I forgot to mark the dummy function as an inline, I'll get that 
fixed soon.

-- 
paul moore
security and virtualization @ redhat
