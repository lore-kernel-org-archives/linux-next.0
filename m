From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 9 Jun 2016 10:58:27 -0700
Message-ID: <CAGXu5jL8T+sAOXFNUn6j8S+yAWeWrN5OS+C8oRVb6xta1+=k4g@mail.gmail.com>
References: <20160609122258.1c2068f0@canb.auug.org.au> <CAGXu5jLxN65Z-+Miiju3VcOK7fpWKqAQY6hn6u5KTZm_NP54kQ@mail.gmail.com>
 <20160609140505.3e336ba3@canb.auug.org.au> <57594B8C.8020006@suse.cz> <20160609193736.db48229a82b9fad7de1562d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160609193736.db48229a82b9fad7de1562d9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emese Revfy <re.emese@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 9, 2016 at 10:37 AM, Emese Revfy <re.emese@gmail.com> wrote:
> On Thu, 9 Jun 2016 12:57:16 +0200
> Michal Marek <mmarek@suse.cz> wrote:
>
>> Dne 9.6.2016 v 06:05 Stephen Rothwell napsal(a):
>> > On Wed, 8 Jun 2016 19:56:38 -0700 Kees Cook <keescook@chromium.org> wrote:
>> >> Ah, yes, that should default to off. We'll get a fix landed ASAP.
>> >
>> > Note that this was an allmodconfig build.  The default is 'n', but
>> > allmodconfig will turn it on (as will allyesconfig).
>>
>> I guess we should make GCC_PLUGINS depend on !COMPILE_TEST. Actually I
>> thought this was already the case, but it is not.
>
> Is it really necessary to disable all gcc plugins or would it be enough
> to disable only the cyc_complexity plugin?

I think disabling (depend on !COMPILE_TEST) plugins that have
non-actionable output make sense. For example, in the future, things
like constify or initify may produce warnings that are "real" in the
sense that they have detected situations that should be fixed in the
code. In a perfect world, we would include those fixes ahead of the
new plugin to keep Stephen from going crazy. :)

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
