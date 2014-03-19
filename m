From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-intel tree
Date: Wed, 19 Mar 2014 08:20:06 +0100
Message-ID: <CAKMK7uFEBe6RwgHBzJ7zwzqhTg1s+mxFKcfVxo6oychvZzZeFw@mail.gmail.com>
References: <20140319115350.7860f102a804a9975ba6e93d@canb.auug.org.au>
 <20140318211842.017be730@gandalf.local.home>
 <20140319015415.GD7956@bwidawsk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140319015415.GD7956@bwidawsk.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Widawsky <ben@bwidawsk.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 19, 2014 at 2:54 AM, Ben Widawsky <ben@bwidawsk.net> wrote:
> On Tue, Mar 18, 2014 at 09:18:42PM -0400, Steven Rostedt wrote:
>> On Wed, 19 Mar 2014 11:53:50 +1100
>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>
>> > Caused by commit a25ca17c1eac ("drm/i915: Do not dereference pointers
>> > from ring buffer in evict event").
>> >
>> > I have used the drm-intel tree from next-20140318 for today.
>> >
>>
>> Bah! I'm still suffering from jet lag (just came back from Linux-Tage
>> in Chemnitz).
>>
>> The next time I compile test a patch for a module, I'll make sure I have
>> that module's config option set :-(  The woe of using localmodconfig. I
>> should have picked the box with the i915. :-/
>>
>> Below is the fix. I'll repost a v2 of the original patch.
>>
>> Sorry about that.
>>
>
> I was about to send out the same fix when I saw this.
>
> Reviewed-by: Ben Widawsky <ben@bwidawsk.net>

Just fixed this this morning before starting to read mail - my
apologies the mess me pushing out a patch yesterday right before
rushing out caused, really shouldn't be doing that ;-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
