From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for December 17 (kvm)
Date: Mon, 20 Dec 2010 10:54:26 +0200
Message-ID: <4D0F19C2.4070906@redhat.com>
References: <20101217173237.fe1de00a.sfr@canb.auug.org.au> <20101217111052.8bba9060.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20101217111052.8bba9060.randy.dunlap@oracle.com>
Sender: kvm-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/17/2010 09:10 PM, Randy Dunlap wrote:
> On Fri, 17 Dec 2010 17:32:37 +1100 Stephen Rothwell wrote:
>
> >  Hi all,
> >
> >  [The mirroring on kernel.org is running slowly]
> >
> >  Changes since 20101216:
>
>
> on i386 builds, I'm seeing this build error:
>
> arch/x86/kvm/vmx.c:488: Error:bad register name `%sil'
>
> but I don't see what is causing it...
>

"=g" needs to be "=qQm"  in vmcs_load().  I'll post a patch.

-- 
error compiling committee.c: too many arguments to function

