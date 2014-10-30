From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: mmotm 2014-10-29-14-19 uploaded
Date: Thu, 30 Oct 2014 10:02:15 +0100
Message-ID: <CAFLxGvwGRz8Z2=eD53VjVgUf5zdM3KCyLcUZN1g_Po2D2xQ4DA@mail.gmail.com>
References: <54515a25.46WrYSce5BExT3V4%akpm@linux-foundation.org>
	<alpine.DEB.2.11.1410292233340.5308@nanos>
	<1414619976.2542.1.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1414619976.2542.1.camel@perches.com>
Sender: owner-linux-mm@kvack.org
To: Joe Perches <joe@perches.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, mm-commits@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.cz>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 29, 2014 at 10:59 PM, Joe Perches <joe@perches.com> wrote:
> On Wed, 2014-10-29 at 22:37 +0100, Thomas Gleixner wrote:
>> On Wed, 29 Oct 2014, akpm@linux-foundation.org wrote:
>> > This mmotm tree contains the following patches against 3.18-rc2:
>> > (patches marked "*" will be included in linux-next)
>> >
>> > * kernel-posix-timersc-code-clean-up.patch
>>
>> Can you please drop this pointless churn? We really can replace all
>> that stuff with a shell script and let it run over the tree every now
>> and then.
>
> Should any automated code reformatting really be done
> by an unsupervised or unreviewed shell script?

As many users of "checkpatch.pl -f" behave anyway like
unsupervised/unreviewed shell scripts
it would not matter. ;-)

-- 
Thanks,
//richard

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
