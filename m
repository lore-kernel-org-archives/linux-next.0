From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: Tree for Jun 20 (kernel/auditsc.c)
Date: Wed, 20 Jun 2018 16:00:10 -0400
Message-ID: <CAHC9VhQv26uPWSYmhNdhJ4QM+AMKK=JFkMmDftLb1WpvOUyN8Q@mail.gmail.com>
References: <20180620144227.18bab881@canb.auug.org.au> <8e17ad17-db3b-7588-b04e-3bd8b54060c0@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e17ad17-db3b-7588-b04e-3bd8b54060c0@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rdunlap@infradead.org, omosnace@redhat.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, linux-audit@redhat.com
List-Id: linux-next.vger.kernel.org

On Wed, Jun 20, 2018 at 11:48 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 06/19/2018 09:42 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20180619:
> >
>
> on x86_64:
>
> kernel/auditsc.o: In function `audit_filter_rules.isra.20':
> auditsc.c:(.text+0x8c5): undefined reference to `groups_search'
> auditsc.c:(.text+0x909): undefined reference to `groups_search'
>
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>
> Full randconfig file is attached.

Thanks Randy.

I believe the issue is that when CONFIG_MULTIUSER is not enabled
groups.{c.o} is not included.  Ondrej, please look into this and
submit a fix as soon as possible, thank you.

-- 
paul moore
www.paul-moore.com
