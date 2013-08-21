From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Aug 21 [ screen corruption in graphical mode ]
Date: Wed, 21 Aug 2013 20:11:27 +0200
Message-ID: <CA+icZUVLau7AgZvcnWKjx=tc4WeuJ3qEH7qQta+YLKDmxk6QvA@mail.gmail.com>
References: <CA+icZUUkS-UptLRM1CfcaHH=8UD-ZaHbXr8wFkA+YKyk-rPjvg@mail.gmail.com>
	<20130821134441.GE26909@phenom.ffwll.local>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=f46d043c82621c12da04e4791ad1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130821134441.GE26909@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>, Chris Wilson <chris@chris-wilson.co.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: linux-next.vger.kernel.org

--f46d043c82621c12da04e4791ad1
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 21, 2013 at 3:44 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Aug 21, 2013 at 12:35:08PM +0200, Sedat Dilek wrote:
>> On Wed, Aug 21, 2013 at 11:21 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Hi all,
>> >
>> > There will be no linux-next trees on Aug 23 or 26.
>> >
>> > Changes since 20130820:
>> >
>> > New tree: aio-direct
>> >
>> > Removed tree: xilinx (at maintainer's request)
>> >
>> > The xfs tree still had its build failure for which I reverted a commit.
>> >
>> > The trivial tree gained conflicts against the crypto, net-next and
>> > wireless trees.
>> >
>> > The aio tree gained conflicts against the aio-direct tree.
>> >
>> > The akpm-current tree gained conflicts against the modules and aio-direct
>> > trees.
>> >
>> > ----------------------------------------------------------------------------
>> >
>>
>> Hi,
>>
>> I still have this issue with next-20130821 and "Linux v3.11-rc6 plus
>> drm-intel-nightly on top"
>> Any new development on this?
>> Patches?
>
> Tbh I'm at a loss what we could try above&beyond what Chris has already
> tried out.
>
>> Currently, I have two workarounds:
>>
>> [1] Revert this commit:
>>
>> commit 5456fe3882812aba251886e36fe55bfefb8e8829
>> "drm/i915: Allocate LLC ringbuffers from stolen"
>
> Since with a rather decent chance the next testing cycle I'll do this
> friday will be the last chunk of features for 3.12 I'll probably drop the
> above patch from my queue and we can try again in 3.13.
>

Inspired by [1] I have switched from UXA to SNA...
...and applied "[PATCH] drm/i915: Cleaning up the relocate entry
function" on top of next-20130821...
...and can NOT see the screen corruptions anymore.

Can you explain that?

- Sedat -

[1] http://cynic.cc/blog//posts/sna_acceleration_vs_uxa/
[2] http://lists.freedesktop.org/archives/intel-gfx/2013-August/032182.html
[3] https://patchwork.kernel.org/patch/2847846/

--f46d043c82621c12da04e4791ad1
Content-Type: application/octet-stream; name="xorg.conf"
Content-Disposition: attachment; filename="xorg.conf"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hkmuwrga0

U2VjdGlvbiAiRGV2aWNlIgogICAgICAgIElkZW50aWZpZXIgIkludGVsIEdyYXBoaWNzIgogICAg
ICAgIERyaXZlciAiaW50ZWwiCiAgICAgICAgT3B0aW9uICJBY2NlbE1ldGhvZCIgInNuYSIKRW5k
U2VjdGlvbgo=
--f46d043c82621c12da04e4791ad1--
