From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the drm-intel tree with
	the drm tree
Date: Thu, 23 Jan 2014 13:10:09 -0800
Message-ID: <CAOesGMjg5hX8KV847DPQrP94GxRPAaMxyGH48BrCyySvFxSLog@mail.gmail.com>
References: <20140122140402.20163da276690810a1040909@canb.auug.org.au>
	<CAKMK7uF+p96YtDo3NG4nBV5S5gYXk55p5KUOxsb+PMY+MH_Zyw@mail.gmail.com>
	<CAOesGMgtavy=gSJQeqqxQFXgSwKGekU2=vwnN2o2TeWhG0bktg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <CAOesGMgtavy=gSJQeqqxQFXgSwKGekU2=vwnN2o2TeWhG0bktg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 22, 2014 at 5:21 PM, Olof Johansson <olof@lixom.net> wrote:
> On Wed, Jan 22, 2014 at 2:06 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> Hi Stephen,
>>
>> On Wed, Jan 22, 2014 at 4:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the drm-intel tree got a conflict in
>>> drivers/gpu/drm/i915/i915_irq.c between commit abca9e454498 ("drm: Pass
>>> 'flags' from the caller to .get_scanout_position()") from the drm tree
>>> and commit d59a63ad8234 ("drm/i915: Add intel_get_crtc_scanline()") from
>>> the drm-intel tree.
>>>
>>> I fixed it up (I think - see below) and can carry the fix as necessary
>>> (no action is required).
>>
>> Oops, this patch escaped - it's only for 3.15. I've shuffled my
>> branches around now for the merge window so this should not pop up in
>> your -next tree again until 3.15 starts.
>
> I just bisected boot failures on x86 chromebooks with -next to this
> merge commit. I'll take a look tomorrow morning and make sure they're
> gone.

Yep, looks happier today.


-Olof
