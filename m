From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Fri, 22 Jul 2016 20:16:53 +0800
Message-ID: <20160722121653.GA32550@wfg-t540p.sh.intel.com>
References: <20160722115620.086b28ca@canb.auug.org.au>
 <20160722022628.GE27987@graphite.smuckle.net>
 <4317240.GoBAVxA9mF@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4317240.GoBAVxA9mF@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Steve Muckle <steve.muckle@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org
List-Id: linux-next.vger.kernel.org

On Fri, Jul 22, 2016 at 02:08:35PM +0200, Rafael J. Wysocki wrote:
>On Thursday, July 21, 2016 07:26:28 PM Steve Muckle wrote:
>> On Fri, Jul 22, 2016 at 11:56:20AM +1000, Stephen Rothwell wrote:
>> > Hi Rafael,
>> >
>> > After merging the pm tree, today's linux-next build (arm
>> > multi_v7_defconfig) failed like this:
>> >
>> > ERROR: "cpufreq_driver_resolve_freq" [kernel/sched/cpufreq_schedutil.ko] undefined!
>> >
>> > Caused by commit
>> >
>> >   5cbea46984d6 ("cpufreq: schedutil: map raw required frequency to driver frequency")
>> >
>> > I used the pm tree from next-20160721 for today.
>>
>> Sorry - I have just sent a patch to address this.
>
>OK, thanks!
>
>Interestingly enough, that hasn't been caught by 0-day.

Sorry it's bisected to a merge commit, hence not reported..
It should be better handled in future.

tree:   git://internal_merge_and_test_tree devel-catchup-201607140443
head:   5f2b635268c560fa7a531e0bdc7765800287ab0f
commit: a868e9fc557aa84ea307d1a394a161420ac20498 [2/12] Merge 'linux-review/Steve-Muckle/cpufreq-avoid-redundant-driver-calls-in-schedutil/20160714-042907' into devel-catchup-201607140443
config: i386-randconfig-s1-201628 (attached as .config)
compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
reproduce:
        git checkout a868e9fc557aa84ea307d1a394a161420ac20498
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> ERROR: "cpufreq_driver_resolve_freq" [kernel/sched/cpufreq_schedutil.ko] undefined!

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
