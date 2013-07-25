From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: Tree for Jul 25 [ call-trace: drm | drm-intel related? ]
Date: Thu, 25 Jul 2013 13:21:43 +0300
Message-ID: <87bo5rx7m0.fsf@intel.com>
References: <CA+icZUVHkYd6xcGe7v-zA8=f+vTF1eF2JszvFPfqzJwE34_2ig@mail.gmail.com> <87ehanx9bx.fsf@intel.com> <CA+icZUXX1-kz9QbY5CpU1UDU8trxgfJSS6ZnUpx9ieq5FnVNSQ@mail.gmail.com> <CA+icZUWOwKH+oF4Ekrkk3pUCjz4Rc361kzdsKjb04WzsEtWPYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUWOwKH+oF4Ekrkk3pUCjz4Rc361kzdsKjb04WzsEtWPYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 25 Jul 2013, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Thu, Jul 25, 2013 at 12:02 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> On Thu, Jul 25, 2013 at 11:44 AM, Jani Nikula
>> <jani.nikula@linux.intel.com> wrote:
>>> On Thu, 25 Jul 2013, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>>> On Thu, Jul 25, 2013 at 7:12 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20130724:
>>>>>
>>>>> Removed tree:
>>>>>         arm-dt (at maintainer's request)
>>>>>
>>>>> The wireless-next tree lost its build failure and gained a conflict
>>>>> against Linus' tree.
>>>>>
>>>>> The tty tree lost its build failure.
>>>>>
>>>>> The staging tree gained a build failure for which I disabled a driver.
>>>>>
>>>>> ----------------------------------------------------------------------------
>>>>>
>>>>
>>>> [ CCing drm and drm-intel folks ]
>>>>
>>>> With today's next-20130725 I see the following:
>>>
>>> Use of dev_priv->gt_lock in I915_WRITE through
>>> intel_disable_gt_powersave before spin lock init, caused by
>>>
>>> commit 181d1b9e31c668259d3798c521672afb8edd355c
>>> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Date:   Sun Jul 21 13:16:24 2013 +0200
>>>
>>>     drm/i915: fix up gt init sequence fallout
>>>
>>
>> Ah, cool.
>>
>> I assumed/tested "drm/i915: fix the racy object accounting", but this
>> does not fix it.
>> Will try with yours.
>>
>
> Sorry, Jani.
>
> next-20130725 ships the patch you pointed, too.

Confused. I meant that the above mentioned commit "drm/i915: fix up gt
init sequence fallout" causes the problem. The patch I included in my
mail should fix it. Could you try that please?

BR,
Jani.



>
> - Sedat -
>
> [1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/log/?id=next-20130725&qt=grep&q=drm%2Fi915%3A+fix+up+gt+init+sequence+fallout
> [2] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=181d1b9e31c668259d3798c521672afb8edd355c
>

-- 
Jani Nikula, Intel Open Source Technology Center
