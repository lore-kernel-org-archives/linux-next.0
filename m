From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: duplicate patches in the kspp and kbuild trees
Date: Mon, 13 Jun 2016 16:57:15 -0700
Message-ID: <CAGXu5jJK25pMi1kG2vUfWkZkDBxCVeLUVs61a=m8qmHDTjPg9g@mail.gmail.com>
References: <20160614094019.14fac372@canb.auug.org.au> <CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 13, 2016 at 4:53 PM, Kees Cook <keescook@google.com> wrote:
> On Mon, Jun 13, 2016 at 4:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Kees,
>>
>> As of today, there are four duplicate patches (different commits)
>> in the kspp and kbuild trees.
>>
>>   Shared library support
>>   GCC plugin infrastructure
>>   Add Cyclomatic complexity GCC plugin
>>   Add sancov plugin
>>
>> are in both trees as different commits :-(  They have been in the kbuild
>> tree for a couple of days already.  One of you should be merging the
>> other's branch, or you both should be mergeing a common branch.
>>
>> Also, Kees, the versions in your tree do not have your Signed-off-by
>> (but do have Michal's).
>
> Strange, I pulled these directly from linux-next. Michal had an
> auto-responder saying he was going to be out-of-office, so I wanted to
> make sure the !COMPILE_TEST fix got in.
>
> Sounds like I should merge the kbuild tree, rather than cherry-picking
> from linux-next? I will adjust.

I've done this merge correctly now and pushed a forced update on the kspp tree.

-Kees

>
> Sorry for the confusion!
>
> -Kees
>
> --
> Kees Cook
> Chrome OS & Brillo Security



-- 
Kees Cook
Chrome OS & Brillo Security
