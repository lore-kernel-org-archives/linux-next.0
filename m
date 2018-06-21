From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] cred: conditionally declare groups-related
 functions
Date: Thu, 21 Jun 2018 10:11:46 -0700
Message-ID: <35e430ea-6351-464d-bd31-77f94dcba9dc@infradead.org>
References: <CAHC9VhQv26uPWSYmhNdhJ4QM+AMKK=JFkMmDftLb1WpvOUyN8Q@mail.gmail.com>
 <20180621083316.8765-1-omosnace@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621083316.8765-1-omosnace@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ondrej Mosnacek <omosnace@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-audit@redhat.com
List-Id: linux-next.vger.kernel.org

On 06/21/2018 01:33 AM, Ondrej Mosnacek wrote:
> The groups-related functions declared in include/linux/cred.h are
> defined in kernel/groups.c, which is compiled only when
> CONFIG_MULTIUSER=y. Move all these function declarations under #ifdef
> CONFIG_MULTIUSER to help avoid accidental usage in contexts where
> CONFIG_MULTIUSER might be disabled.
> 
> This patch also adds a fallback for groups_search(). Currently this
> function is only called from kernel/groups.c itself and
> keys/permissions.c, which depends on CONFIG_MULTIUSER. However, the
> audit subsystem (which does not depend on CONFIG_MULTIUSER) calls this
> function in -next, so the fallback will be needed to avoid compilation
> errors or ugly workarounds.
> 
> See also:
> https://lkml.org/lkml/2018/6/20/670
> https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git/commit/?h=next&id=af85d1772e31fed34165a1b3decef340cf4080c0
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/cred.h | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)


-- 
~Randy
