From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: build failure after merge of the selinux tree
Date: Tue, 19 Mar 2019 13:11:10 -0400
Message-ID: <CAHC9VhQB2OECVhgQNmwikBNs=RwC+Of7kUFLfUze+Dp3WYu2Gg@mail.gmail.com>
References: <20190319124034.13ff6044@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319124034.13ff6044@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, Dominick Grift <dominick.grift@defensec.nl>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 18, 2019 at 9:40 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the selinux tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from /home/sfr/next/next/scripts/selinux/mdp/mdp.c:35:
> /home/sfr/next/next/include/linux/kconfig.h:5:10: fatal error: generated/autoconf.h: No such file or directory
>  #include <generated/autoconf.h>
>           ^~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   e37c1877ba5b ("scripts/selinux: modernize mdp")
>
> I have used the selinux tree from next-20190318 for today.

Thanks for the report, I just merged the fix below into selinux/next:

  commit ccd19d4cafaaf36132c372e77ee9304b707c1e70
  Author: Stephen Smalley <sds@tycho.nsa.gov>
  Date:   Tue Mar 19 09:21:06 2019 -0400

   scripts/selinux: fix build

   We need to add the object tree include directory to the include path
   for building mdp in order to pick up generated/autoconf.h. Otherwise,
   make O=/path/to/objtree breaks.

   Fixes: e37c1877ba5b ("scripts/selinux: modernize mdp")
   Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
   Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
   Signed-off-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com
