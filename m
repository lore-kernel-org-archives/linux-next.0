From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for Apr 24 (kvm)
Date: Wed, 25 Apr 2012 12:35:01 +0300
Message-ID: <4F97C545.4030304@redhat.com>
References: <20120424154354.7feba600beac616833d034de@canb.auug.org.au> <4F96D3FA.1010909@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <4F96D3FA.1010909@xenotime.net>
Sender: kvm-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 04/24/2012 07:25 PM, Randy Dunlap wrote:
> On 04/23/2012 10:43 PM, Stephen Rothwell wrote:
>
> > Hi all,
> > 
> > There will probably be no linux-next release until April 30 as I am
> > taking a break.
> > 
> > Changes since 20120423:
>
>
> on i386:
>
>   CC [M]  arch/x86/kvm/emulate.o
> arch/x86/kvm/emulate.c: Assembler messages:
> arch/x86/kvm/emulate.c:4122: Error: bad register name `%bpl'
>
>

Fix already committed, will be pushed later today.

-- 
I have a truly marvellous patch that fixes the bug which this
signature is too narrow to contain.

