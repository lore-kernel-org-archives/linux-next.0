From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 20 Sep 2018 20:48:55 +1000
Message-ID: <875zz0jvfs.fsf@concordia.ellerman.id.au>
References: <20180919094847.2103082b@canb.auug.org.au> <20180919073826.02370812@canb.auug.org.au> <20180910133525.28c5dd20@canb.auug.org.au> <15925.1537309041@warthog.procyon.org.uk> <3565.1537336860@warthog.procyon.org.uk> <20180919163102.1a0adefb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919163102.1a0adefb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi David,
>
> On Wed, 19 Sep 2018 07:01:00 +0100 David Howells <dhowells@redhat.com> wrote:
>>
>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> 
>> > > I think the problem is that I haven't allocated system call numbers for
>> > > any arches other than x86 - even the x86 syscall numbers are provisional
>> > > until the patchset is taken upstream.  I'm not sure of the best way to
>> > > deal with this - make the samples dependent on the X86 arch?  
>> > 
>> > But the sample programs are built with HOSTCC, so you can't depend on
>> > ARCH (since I, for one, am cross compiling).  Maybe SUBARCH.  Better
>> > would be to use either Kconfig's shell primitive or some make magic to
>> > figure out if the syscall number define's are defined.  
>> 
>> I meant put the dependency in the Kconfig.
>
> Yeah, sure.  Kconfig now has the ability for that dependency to be the
> result of an external program "$(shell ....)", so you could have a
> script or program that checked to see if the syscall numbers are
> defined and then have the Kconfig symbol(s) for the tests depend on that.

I realise these are in samples rather than selftests, but what most of
the selftests do is just #define the syscall number if it's not defined,
so that you're not dependent on getting the headers.

cheers
