From: Paul McKenney <paulmckrcu@gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Mon, 27 Mar 2017 10:14:10 -0700
Message-ID: <CAJzB8QG8bE1onedcBLJPcwQwVH4BrpNcWNzpH00JMfDqgyzObQ@mail.gmail.com>
References: <20170322110050.1e2ea77d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0914391753=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170322110050.1e2ea77d@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============0914391753==
Content-Type: multipart/alternative; boundary=001a11491230cb8844054bb978c0

--001a11491230cb8844054bb978c0
Content-Type: text/plain; charset=UTF-8

> On Tue, Mar 21, 2017 at 5:00 PM, Stephen Rothwell <sfr@canb.auug.org.au>
wrote:
> Hi Dave,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/i915/i915_gem_shrinker.c
>
> between commit:
>
>   3d3d18f086cd ("drm/i915: Avoid rcu_barrier() from reclaim paths
(shrinker)")
>
> from the drm-intel-fixes tree and commit:
>
>   519d52498156 ("drm/i915: i915_gem_shrink_all() needs an awake device")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/i915/i915_gem_shrinker.c
> index d5d2b4c6ed38,006a8b908f77..000000000000
> --- a/drivers/gpu/drm/i915/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/i915_gem_shrinker.c
> @@@ -263,7 -264,9 +264,9 @@@ unsigned long i915_gem_shrink_all(struc
>                                 I915_SHRINK_BOUND |
>                                 I915_SHRINK_UNBOUND |
>                                 I915_SHRINK_ACTIVE);
> +       intel_runtime_pm_put(dev_priv);
> +
>  -      rcu_barrier(); /* wait until our RCU delayed slab frees are
completed */
>  +      synchronize_rcu(); /* wait for our earlier RCU delayed slab frees
*/

Unless I am really confused, the RCU delayed slab frees are via call_rcu().
This means that synchronize_rcu() is -not- guaranteed to wait on them.
For example, CPU 0 might be making its way through a pile of callbacks,
including some RCU delayed slab free callbacks.  If there are enough
callbacks, it could take CPU 0 several grace periods to work through the
backlog.  CPU 1 might have no callbacks queued, and might execute the
above code.  Now synchronize_rcu() will wait for a grace period, but only
one, and not necessarily for CPU 0's backlog to drain.

I do not believe that the above fix is safe.

>         return freed;
>   }
>

--001a11491230cb8844054bb978c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
 class=3D"gmail_quote">&gt; On Tue, Mar 21, 2017 at 5:00 PM, Stephen Rothwe=
ll &lt;<a href=3D"mailto:sfr@canb.auug.org.au">sfr@canb.auug.org.au</a>&gt;=
 wrote:</div><div class=3D"gmail_quote">&gt; Hi Dave,</div><div class=3D"gm=
ail_quote">&gt;=C2=A0</div><div class=3D"gmail_quote">&gt; Today&#39;s linu=
x-next merge of the drm tree got a conflict in:</div><div class=3D"gmail_qu=
ote">&gt;=C2=A0</div><div class=3D"gmail_quote">&gt; =C2=A0 drivers/gpu/drm=
/i915/i915_gem_shrinker.c</div><div class=3D"gmail_quote">&gt;=C2=A0</div><=
div class=3D"gmail_quote">&gt; between commit:</div><div class=3D"gmail_quo=
te">&gt;=C2=A0</div><div class=3D"gmail_quote">&gt; =C2=A0 3d3d18f086cd (&q=
uot;drm/i915: Avoid rcu_barrier() from reclaim paths (shrinker)&quot;)</div=
><div class=3D"gmail_quote">&gt;=C2=A0</div><div class=3D"gmail_quote">&gt;=
 from the drm-intel-fixes tree and commit:</div><div class=3D"gmail_quote">=
&gt;=C2=A0</div><div class=3D"gmail_quote">&gt; =C2=A0 519d52498156 (&quot;=
drm/i915: i915_gem_shrink_all() needs an awake device&quot;)</div><div clas=
s=3D"gmail_quote">&gt;=C2=A0</div><div class=3D"gmail_quote">&gt; from the =
drm tree.</div><div class=3D"gmail_quote">&gt;=C2=A0</div><div class=3D"gma=
il_quote">&gt; I fixed it up (see below) and can carry the fix as necessary=
. This</div><div class=3D"gmail_quote">&gt; is now fixed as far as linux-ne=
xt is concerned, but any non trivial</div><div class=3D"gmail_quote">&gt; c=
onflicts should be mentioned to your upstream maintainer when your tree</di=
v><div class=3D"gmail_quote">&gt; is submitted for merging.=C2=A0 You may a=
lso want to consider cooperating</div><div class=3D"gmail_quote">&gt; with =
the maintainer of the conflicting tree to minimise any particularly</div><d=
iv class=3D"gmail_quote">&gt; complex conflicts.</div><div class=3D"gmail_q=
uote">&gt;=C2=A0</div><div class=3D"gmail_quote">&gt; --</div><div class=3D=
"gmail_quote">&gt; Cheers,</div><div class=3D"gmail_quote">&gt; Stephen Rot=
hwell</div><div class=3D"gmail_quote">&gt;=C2=A0</div><div class=3D"gmail_q=
uote">&gt; diff --cc drivers/gpu/drm/i915/i915_gem_shrinker.c</div><div cla=
ss=3D"gmail_quote">&gt; index d5d2b4c6ed38,006a8b908f77..000000000000</div>=
<div class=3D"gmail_quote">&gt; --- a/drivers/gpu/drm/i915/i915_gem_shrinke=
r.c</div><div class=3D"gmail_quote">&gt; +++ b/drivers/gpu/drm/i915/i915_ge=
m_shrinker.c</div><div class=3D"gmail_quote">&gt; @@@ -263,7 -264,9 +264,9 =
@@@ unsigned long i915_gem_shrink_all(struc</div><div class=3D"gmail_quote"=
>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I915_SHRINK_BOUND |</div><div cl=
ass=3D"gmail_quote">&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I915_SHRINK_=
UNBOUND |</div><div class=3D"gmail_quote">&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 I915_SHRINK_ACTIVE);</div><div class=3D"gmail_quote">&gt; + =C2=
=A0 =C2=A0 =C2=A0 intel_runtime_pm_put(dev_priv);</div><div class=3D"gmail_=
quote">&gt; +</div><div class=3D"gmail_quote">&gt; =C2=A0- =C2=A0 =C2=A0 =
=C2=A0rcu_barrier(); /* wait until our RCU delayed slab frees are completed=
 */</div><div class=3D"gmail_quote">&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0synchr=
onize_rcu(); /* wait for our earlier RCU delayed slab frees */</div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Unless I am really=
 confused, the RCU delayed slab frees are via call_rcu().</div><div class=
=3D"gmail_quote">This means that synchronize_rcu() is -not- guaranteed to w=
ait on them.</div><div class=3D"gmail_quote">For example, CPU 0 might be ma=
king its way through a pile of callbacks,</div><div class=3D"gmail_quote">i=
ncluding some RCU delayed slab free callbacks.=C2=A0 If there are enough</d=
iv><div class=3D"gmail_quote">callbacks, it could take CPU 0 several grace =
periods to work through the</div><div class=3D"gmail_quote">backlog.=C2=A0 =
CPU 1 might have no callbacks queued, and might execute the</div><div class=
=3D"gmail_quote">above code.=C2=A0 Now synchronize_rcu() will wait for a gr=
ace period, but only</div><div class=3D"gmail_quote">one, and not necessari=
ly for CPU 0&#39;s backlog to drain.</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">I do not believe that the above fix is safe.=
</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return freed;</div><div class=3D"gmail_quote">&=
gt; =C2=A0 }</div><div class=3D"gmail_quote">&gt;=C2=A0</div></div></div></=
div>

--001a11491230cb8844054bb978c0--

--===============0914391753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0914391753==--
