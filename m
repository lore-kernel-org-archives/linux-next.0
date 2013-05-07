From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-intel tree with
	Linus' tree
Date: Tue, 7 May 2013 10:43:17 +0200
Message-ID: <CAKMK7uEr4Fs00nM3iuwwBdd+LV3_6w2sarR+i8tk02BrTHQmNA@mail.gmail.com>
References: <20130507112751.195757b78defdbea58aa6134@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130507112751.195757b78defdbea58aa6134@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On Tue, May 7, 2013 at 3:27 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the drm-intel tree got a conflict in
> drivers/gpu/drm/i915/i915_reg.h between commit a65851af5938 ("drm/i915:
> Make data/link N value power of two") from Linus' tree and commit
> e3b95f1eb5b9 ("drm/i915: Apply OCD to data/link m/n register #defines")
> from the drm-intel tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> Daniel, I assume all this stuff being added to the drm-intel tree is
> going upstream very soon?

Oops, no that is stuff for 3.11. Lazy me hoped I could sneak stuff
through (since we just keep on merging features to
drm-intel-next-queued to avoid stalls), but that's obviously not what
you want for linux-next. My apologies for that mess. I've now created
a for-linux-next branch which will not contain patches heading for
3.x+1 while 3.x-rc1 hasn't been released yet.

Can you please switch over to that branch for inclusion into linux-next?

Yours, Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
