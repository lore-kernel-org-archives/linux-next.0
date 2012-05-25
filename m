From: viresh kumar <viresh.linux@gmail.com>
Subject: Re: [linux-next] "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Fri, 25 May 2012 15:07:15 +0530
Message-ID: <CAOh2x==2pFz_37Xjrb9wpeG8HMrMUf72+-iT30d14paQntr+7A@mail.gmail.com>
References: <20120522234621.GA3610@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2185737738537465774=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120522234621.GA3610@windriver.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, spear-devel@list.st.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

--===============2185737738537465774==
Content-Type: multipart/alternative; boundary=f46d043c80601d3ba504c0d91dc3

--f46d043c80601d3ba504c0d91dc3
Content-Type: text/plain; charset=ISO-8859-1

On May 23, 2012 5:18 AM, "Paul Gortmaker" <paul.gortmaker@windriver.com>
wrote:
>
> Hi Viresh,
>
> The above listed commit, in linux-next as:
>
> commit ebbf0cb5d39cc3e22ef4c425475e76b7f45027de
>
>    "clk: add non CONFIG_HAVE_CLK routines"
>
> shows up as failures in the netx_defconfig, since there
> are duplicate stub functions between your changes and the
> file below:
>
>  arch/arm/mach-netx/fb.c:72:6: error: redefinition of 'clk_disable'
>  include/linux/clk.h:299:51: note: previous definition of 'clk_disable'
was here
>  arch/arm/mach-netx/fb.c:76:5: error: redefinition of 'clk_set_rate'
>  include/linux/clk.h:306:50: note: previous definition of 'clk_set_rate'
was here
>  arch/arm/mach-netx/fb.c:81:5: error: redefinition of 'clk_enable'
>  include/linux/clk.h:294:50: note: previous definition of 'clk_enable'
was here
>  arch/arm/mach-netx/fb.c:86:13: error: redefinition of 'clk_get'
>  include/linux/clk.h:280:58: note: previous definition of 'clk_get' was
here
>  arch/arm/mach-netx/fb.c:91:6: error: redefinition of 'clk_put'
>  include/linux/clk.h:290:51: note: previous definition of 'clk_put' was
here
>  make[2]: *** [arch/arm/mach-netx/fb.o] Error 1
>

Hi Paul,

I don't have access to any Linux machine for now as i am on leave.

Actually i have left ST and will join the next company in few weeks.

If you can provide a patch for this, i can review it.

--
Viresh

--f46d043c80601d3ba504c0d91dc3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On May 23, 2012 5:18 AM, &quot;Paul Gortmaker&quot; &lt;<a href=3D"mailto:p=
aul.gortmaker@windriver.com">paul.gortmaker@windriver.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi Viresh,<br>
&gt;<br>
&gt; The above listed commit, in linux-next as:<br>
&gt;<br>
&gt; commit ebbf0cb5d39cc3e22ef4c425475e76b7f45027de<br>
&gt;<br>
&gt; =A0 =A0&quot;clk: add non CONFIG_HAVE_CLK routines&quot;<br>
&gt;<br>
&gt; shows up as failures in the netx_defconfig, since there<br>
&gt; are duplicate stub functions between your changes and the<br>
&gt; file below:<br>
&gt;<br>
&gt; =A0arch/arm/mach-netx/fb.c:72:6: error: redefinition of &#39;clk_disab=
le&#39;<br>
&gt; =A0include/linux/clk.h:299:51: note: previous definition of &#39;clk_d=
isable&#39; was here<br>
&gt; =A0arch/arm/mach-netx/fb.c:76:5: error: redefinition of &#39;clk_set_r=
ate&#39;<br>
&gt; =A0include/linux/clk.h:306:50: note: previous definition of &#39;clk_s=
et_rate&#39; was here<br>
&gt; =A0arch/arm/mach-netx/fb.c:81:5: error: redefinition of &#39;clk_enabl=
e&#39;<br>
&gt; =A0include/linux/clk.h:294:50: note: previous definition of &#39;clk_e=
nable&#39; was here<br>
&gt; =A0arch/arm/mach-netx/fb.c:86:13: error: redefinition of &#39;clk_get&=
#39;<br>
&gt; =A0include/linux/clk.h:280:58: note: previous definition of &#39;clk_g=
et&#39; was here<br>
&gt; =A0arch/arm/mach-netx/fb.c:91:6: error: redefinition of &#39;clk_put&#=
39;<br>
&gt; =A0include/linux/clk.h:290:51: note: previous definition of &#39;clk_p=
ut&#39; was here<br>
&gt; =A0make[2]: *** [arch/arm/mach-netx/fb.o] Error 1<br>
&gt;</p>
<p>Hi Paul,</p>
<p>I don&#39;t have access to any Linux machine for now as i am on leave.</=
p>
<p>Actually i have left ST and will join the next company in few weeks.</p>
<p>If you can provide a patch for this, i can review it.</p>
<p>--<br>
Viresh</p>

--f46d043c80601d3ba504c0d91dc3--


--===============2185737738537465774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2185737738537465774==--
