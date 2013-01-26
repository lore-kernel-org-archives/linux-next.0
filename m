From: Avi Kivity <avi.kivity@gmail.com>
Subject: Re: linux-next: Tree for Jan 25 (kvm)
Date: Sat, 26 Jan 2013 23:57:00 +0200
Message-ID: <CAEbWaipy03Rg=KQZg3-aOX3t_-za3Ud-zCAxKoFVED1d7tZnfA@mail.gmail.com>
References: <20130125162606.edff84fcf6f62ed2b7c4d719@canb.auug.org.au>
	<5102B8A6.3090200@infradead.org>
	<20130126104634.997ac68f6971397b9f4d09d3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20130126104634.997ac68f6971397b9f4d09d3@canb.auug.org.au>
Sender: kvm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>
List-Id: linux-next.vger.kernel.org

On Sat, Jan 26, 2013 at 1:46 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Fri, 25 Jan 2013 08:53:58 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Seeing lots of this error on i386:
>>
>> arch/x86/kvm/emulate.c:1016: Error: unsupported for `push'
>
> Caused by commit 9ae9febae950 ("KVM: x86 emulator: covert SETCC to
> fastop") from the kvm tree.  cc's added.
>


I posted a fix.
