From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] Documentation/vDSO: don't build tests when cross compiling
Date: Mon, 22 Jun 2015 12:46:10 -0700
Message-ID: <CALCETrX1r6_CJgN=iZsnOxdOQRNgc6JH-qBN2O9-Hu-jDnxTpw@mail.gmail.com>
References: <1434849028-26733-1-git-send-email-paul.gortmaker@windriver.com>
 <20150622104124.62299220@lwn.net> <CALCETrU=OZBbQhzi-7mSM5AXor15rqynrVippv9nMbKCxHGu7A@mail.gmail.com>
 <20150622190942.GM16386@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150622190942.GM16386@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 22, 2015 at 12:09 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> [Re: [PATCH] Documentation/vDSO: don't build tests when cross compiling] On 22/06/2015 (Mon 10:01) Andy Lutomirski wrote:
>
>> On Mon, Jun 22, 2015 at 9:41 AM, Jonathan Corbet <corbet@lwn.net> wrote:
>> > On Sat, 20 Jun 2015 21:10:28 -0400
>> > Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>> >
>> >> The following was seen in linux-next build coverage, which is somewhat
>> >> unique since it uses powerpc host to cross compile x86:
>> >>
>> >> Documentation/vDSO/vdso_standalone_test_x86.c:49:2: error: impossible
>> >> register constraint in 'asm'
>> >> make[4]: *** [Documentation/vDSO/vdso_standalone_test_x86.o] Error 1
>> >>
>> >> It probably makes sense to just skip building these tests when
>> >> we are cross compiling.
>> >
>> > So I guess I'm not totally averse to applying these; getting rid of build
>> > errors is a good thing.  But I do get the feeling like it's papering over
>> > the real problem.  As a general rule, cross-compiling works; what's
>> > special about these programs that makes it fail?
>>
>> Agreed.  What gcc version is this?
>
> Just to re-iterate, this is ppc host, cross compiling x86_64 target.
>
> The linux-next build I saw the errors in this weekend is here:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/12445538/
>
> According to that, it is gcc 4.6.3
>
> It seems that the assumption is that nobody cross compiles x86, so
> when people see CONFIG_X86_64 set, they assume HOSTCC can create x86
> binaries and will do so by default.  Hence the breakdown in creation
> of some of these sample programs.  We've already a similar fix in
> mainline in e9107f88c985bc ("samples/seccomp/Makefile: do not build
> tests if cross-compiling for MIPS")
>
> I've added linux-next folks to Cc: -- probably should have done that on
> the original send...  they know more about the toolchains used for -next.

Oh, right.

Do we have something like hostprogs that builds for the target instead
of the host?

--Andy
