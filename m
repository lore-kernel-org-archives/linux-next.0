From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for April 26 (kvm)
Date: Wed, 27 Apr 2011 10:49:15 +0300
Message-ID: <4DB7CA7B.1000603@redhat.com>
References: <20110426202605.c66ce0ea.sfr@canb.auug.org.au> <20110426083940.934e0e6f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110426083940.934e0e6f.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>
List-Id: linux-next.vger.kernel.org

On 04/26/2011 06:39 PM, Randy Dunlap wrote:
> On Tue, 26 Apr 2011 20:26:05 +1000 Stephen Rothwell wrote:
>
> >  Hi all,
> >
> >  The kernel.org mirroring is being very slow today.
>
> on i386:
>
> ERROR: "__get_user_X" [arch/x86/kvm/kvm.ko] undefined!

Thanks, this has already been noted; we'll fix this shortly.

-- 
error compiling committee.c: too many arguments to function
