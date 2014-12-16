From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for Dec 16
Date: Tue, 16 Dec 2014 10:45:49 +0000
Message-ID: <54900D5D.4060509@imgtec.com>
References: <20141216154622.7c2ded16@canb.auug.org.au>	<20141216063549.GA1060@roeck-us.net> <20141215224444.dc7f0f3c.akpm@linux-foundation.org> <548FD746.1050904@roeck-us.net> <548FFEA0.1060905@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="D8SJq4EiqKsNHIJfwK2x6boug70XUT0Hv"
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548FFEA0.1060905-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

--D8SJq4EiqKsNHIJfwK2x6boug70XUT0Hv
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 16/12/14 09:42, James Hogan wrote:
> On 16/12/14 06:55, Guenter Roeck wrote:
>> On 12/15/2014 10:44 PM, Andrew Morton wrote:
>>> On Mon, 15 Dec 2014 22:35:49 -0800 Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>=

>>> wrote:
>>>
>>>> On Tue, Dec 16, 2014 at 03:46:22PM +1100, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Please do not add any code destined for v3.20 to your linux-next
>>>>> included
>>>>> trees/branches until after v3.19-rc1 is released.
>>>>>
>>>>> Changes since 20141215:
>>>>>
>>>>> The infiniband tree gained a conflict against Linus' tree and a bui=
ld
>>>>> failure so I used the version from next-20141215.
>>>>>
>>>>> The userns tree gained a conflict against the vfs tree.
>>>>>
>>>>> The clk tree gained a build failure so I used the version from
>>>>> next-20141215.
>>>>>
>>>>> Non-merge commits (relative to Linus' tree): 3588
>>>>>   2582 files changed, 123494 insertions(+), 135748 deletions(-)
>>>>>
>>>>
>>>> My metag buildbot test fails with this kernel.
>>>
>>> Thanks.  What are the error messages?
>>>
>>>
>> Nothing. It just hangs until killed.
>>
>> qemu log:
>> char device redirected to /dev/pts/5
>> Unable to load ROM!
>> qemu: terminating on signal 15 from pid 17843
>>
>> http://server.roeck-us.net:8010/builders/qemu-metag-next/builds/60/ste=
ps/qemubuildcommand/logs/stdio
>=20
> Thanks a lot Guenter for report and bisection. I've confirmed on real
> hardware too. I'll try debugging it.

The fmt in the first printk gets corrupted and causes a memory fault
because the stack isn't 64-bit aligned. The args get saved with a 64-bit
store (but unaligned access checking isn't turned on yet so this
silently does the wrong thing), and then read as 1 with a 32-bit load.

Enabling unaligned access checking from boot makes it fail at
metag_start_kernel, immediately after stack pointer is set to
init_thread_union + THREAD_INFO_SIZE. Basically the restart_block was
the only thing keeping the struct thread_info as a whole 64-bit aligned
on Meta.

The patch below fixes it. Please can it be squashed into commit "all
arches, signal: move restart_block to struct task_struct".

Thanks
James

=46rom 3ec117304ebde939fd181129227de28c068e7fa2 Mon Sep 17 00:00:00 2001
From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Date: Tue, 16 Dec 2014 10:15:33 +0000
Subject: [PATCH] metag: Align thread_info::supervisor_stack

Commit a82be12232dc ("all arches, signal: move restart_block to struct
task_struct") removed restart_block from struct thread_info which was
the only thing keeping supervisor_stack and the struct as a whole 64-bit
aligned. This resulted in the initial stack pointer not being 64-bit
aligned, so when arguments are saved to the stack with a 64-bit SETL
instruction the values are corrupted resulting in a pretty early
unserviced memory fault in printk.

This is fixed by explicitly aligning supervisor_stack to 8 bytes.

Fixes: a82be12232dc ("all arches, signal: move restart_block to struct ta=
sk_struct")
Reported-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
---
 arch/metag/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/metag/include/asm/thread_info.h b/arch/metag/include/as=
m/thread_info.h
index ff4332435d15..afb3ca4776d1 100644
--- a/arch/metag/include/asm/thread_info.h
+++ b/arch/metag/include/asm/thread_info.h
@@ -36,7 +36,7 @@ struct thread_info {
=20
 	mm_segment_t addr_limit;	/* thread address space */
=20
-	u8 supervisor_stack[0];
+	u8 supervisor_stack[0] __aligned(8);
 };
=20
 #else /* !__ASSEMBLY__ */
--=20
2.0.4


--D8SJq4EiqKsNHIJfwK2x6boug70XUT0Hv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUkA1kAAoJEGwLaZPeOHZ6UwMP/jTjcTnf1Ot0TwadYcGYa9mv
KH/UvAbIDUsZc5ATfd8pxY4Bdmf8qTagqy0SmuhcODB4m6U2v0ei1L5WnXGONt3r
I4/aeDn0JHffZIcaTRbHdSEnGkxiD9byZKSkYYQ9nCC/EuCneS5tnBNP6+6Bru5o
lAai4JaLB6/mvolfETLHvGqPC1PS1eXF9xqXHs3Y7tmJjVk6M59UyTC6q4jDG4Wn
VD7T0nc0NjiFWVoQ9jDRqq/mJ9H0bQV/qHdV4tPnK5XFGuhq+Yzhf93Fjcpxuj4t
IgVJLN6Wcn940v7mIJicXMGShbFi+7NQ0yv59/84VdQilM5uIG/bsfoTnE4z01FN
QZaRuvGk/kG4a2jeeN0LsyYx/uYgikpfyFASSdtg69OxAFjwGMZTpJjrO4G83foK
gB8WBIXRn1PFu+3Gfm3b8Pdl3g9pHhzFMAPPcK7Uu+9CH4Mk+oLu8RKcDmaBIXs2
vIm+pxQcWmIojs/tLgBjx9P/sBVegmw52N1FlJSGlf0tn2rFTqeS+7P7fMxnqpld
yQwl3S9paWMChhWvQ3GWlVthEAEFQHPyf5GMP/noXHorMAQzmaJMyxjgX7yZcOHX
tfRqQX2x4hZWXpXeZqybppSJL05JXN3vfddjrbIstEfGc2FEaPql3fBa9/X/Zxmy
c06y8HMg6v857R7qyWmX
=rDxa
-----END PGP SIGNATURE-----

--D8SJq4EiqKsNHIJfwK2x6boug70XUT0Hv--
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
