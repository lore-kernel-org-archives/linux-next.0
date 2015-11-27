From: Vaibhav Shinde <v.bhav.shinde@gmail.com>
Subject: handling oz_ep_alloc() failure
Date: Fri, 27 Nov 2015 14:56:28 +0530
Message-ID: <CAB5gotttiJgbdCYV7GxeHqLoH4iekM+QU99kKZqj=M86XEY_7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11401b2e3f346605258249c7
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

--001a11401b2e3f346605258249c7
Content-Type: text/plain; charset=UTF-8

I got a failure for allocation of order 3 pages from oz_ep_alloc() function
under low memory situation, so while checking the code came across this
call for oz_ep_alloc() which may not be handled gracefully.
So do we need to have the below check ?

$ git diff
diff --git a/drivers/staging/ozwpan/ozhcd.c b/drivers/staging/ozwpan/ozhcd.c
index 565d873..867c3eb 100644
--- a/drivers/staging/ozwpan/ozhcd.c
+++ b/drivers/staging/ozwpan/ozhcd.c
@@ -722,6 +722,8 @@ void *oz_hcd_pd_arrived(void *hpd)
         * use for out endpoint 0.
         */
        ep = oz_ep_alloc(GFP_ATOMIC, 0);
+       if(!ep)
+               goto out;
        spin_lock_bh(&ozhcd->hcd_lock);
        if (ozhcd->conn_port >= 0) {
                spin_unlock_bh(&ozhcd->hcd_lock);

--001a11401b2e3f346605258249c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span></span>I got a failure for allocation of order =
3 pages from oz_ep_alloc() function under low memory situation, so while ch=
ecking the code came across this call for oz_ep_alloc() which may not be ha=
ndled gracefully.<br>So do we need to have the below check ?<br><br>$ git d=
iff<br>diff --git a/drivers/staging/ozwpan/ozhcd.c b/drivers/staging/ozwpan=
/ozhcd.c<br>index 565d873..867c3eb 100644<br>--- a/drivers/staging/ozwpan/o=
zhcd.c<br>+++ b/drivers/staging/ozwpan/ozhcd.c<br>@@ -722,6 +722,8 @@ void =
*oz_hcd_pd_arrived(void *hpd)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* use fo=
r out endpoint 0.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ep =3D oz_ep_alloc(GFP_ATOMIC, 0);<br>+ =C2=A0 =C2=A0 =C2=A0 =
if(!ep)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_bh(&amp;ozhcd-&gt;hcd_lock);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (ozhcd-&gt;conn_port &gt;=3D 0) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_bh(&amp;ozhcd-&gt=
;hcd_lock);<br></div></div>

--001a11401b2e3f346605258249c7--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
