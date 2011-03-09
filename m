From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Wed, 9 Mar 2011 12:53:57 +0100
Message-ID: <AANLkTikH-Q5jnLfwNVFi2wmDOeddgo6Aq8fndVRSGj7Y@mail.gmail.com>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016361e82e44cc10f049e0b62d7
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:46509 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756102Ab1CILx6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2011 06:53:58 -0500
Received: by qyg14 with SMTP id 14so343892qyg.19
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2011 03:53:58 -0800 (PST)
In-Reply-To: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthias Klose <doko@debian.org>
Cc: linux-next <linux-next@vger.kernel.org>, debian-gcc <debian-gcc@lists.debian.org>, binutils <binutils@sourceware.org>, amodra@gmail.com, "H.J. Lu" <hjl.tools@gmail.com>

--0016361e82e44cc10f049e0b62d7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 8, 2011 at 11:44 AM, Sedat Dilek <sedat.dilek@googlemail.com> w=
rote:
> Hi,
>
> my build of linux-next (next-20110308, the same with the one from
> yesterday) is broken.
> (I translated the German output.)
>
> [ build.log ]
> =C2=A0AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/entry_32.o
> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arc=
h/x86/kernel/entry_32.S:
> Assembler messages:
> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arc=
h/x86/kernel/entry_32.S:1421:
> Error: .size expression does not evaluate to a constant
> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error 1)
> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
> make[4]: *** [arch/x86] Fehler 2 (Error 2)
> make[4]: *** Warte auf noch nicht beendete Prozesse... (Waiting for
> unfinished jobs...)
>
> I am not sure if this is a problem of Debian's binutils snapshot from
> binutils-2_21-branch (Debian-version: 2.21.0.20110302-1) from sid/i386
> or this is only a problem for x86, but I just want to let you know.
>
> FYI: The previous binutils (2.21.0.20110216-2) works fine.
>
> I have tried with reverting the last two changes to
> arch/x86/kernel/entry_32.S in linux-next:
>
> "x86: Use {push,pop}_cfi in more places" (see [1])
> "x86, asm: Cleanup unnecssary macros in asm-offsets.c" (see [2])
>
> Reverting both or [1] or [2] breaks with Debians as (2.21.0.20110302-1).
>
> BTW, [3] has a complete GIT history for the above file.
>
> So, I am unsure from where the problem exactly aroses.
> If this a known issue (and a fix around) or rings a bell to you, let
> me and others know.
>
> Thanks in advance.
>
> Regards,
> - Sedat -
>
> [1] http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dc=
ommit;h=3D60cf637a13932a4750da6746efd0199e8a4c341b
>
> [2] http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dc=
ommit;h=3D7bf04be8f48ceeeffa5b5a79734d6d6e0d59e5f8
>
> [3] http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dh=
istory;f=3Darch/x86/kernel/entry_32.S;h=3D2878821cb8c1da1d7147b26271114fa95=
46afe03;hb=3DHEAD
>

Just FYI (for the "dropped" MLs while finding the "brain bug"):
Finally, with the help of x86 folks and H.J. Lu a fix for the
linux-kernel can now be found in [1].

Commits [2] and [3] from binutils master GIT helped to dig deeper into
the right places.
So I would appreciated both to be backported to binutils-2_21-branch GIT.

@Matthias:
If you like you can use the two backported patches (see file
attachments) for a next binutils upload to Debian/sid.
As usually (and you demanded once from me) I dropped any ChangeLog
entries from the code, but kept the history in the commit-text. Also,
I documented my changes.
So the patches should cleanly apply.

Thanks.

- Sedat -

[1] https://patchwork.kernel.org/patch/621001/
[2] http://sourceware.org/git/?p=3Dbinutils.git;a=3Dcommit;h=3Db9521fc0be79=
45fc842ce1197e241a023378125d
[3] http://sourceware.org/git/?p=3Dbinutils.git;a=3Dcommit;h=3Dcbd141bb69f7=
91de7ea1581abe7afb34f0c61288

--0016361e82e44cc10f049e0b62d7
Content-Type: text/plain; charset=US-ASCII;
	name="0001-Mention-symbol-name-in-non-constant-.size-expression.patch"
Content-Disposition: attachment;
	filename="0001-Mention-symbol-name-in-non-constant-.size-expression.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gl26jxqr0

RnJvbSAzNzA4YmRkMDY3OTJlODEyYWNkOWRhNzExYjUxNDgyYzBiNGIyNzk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDggTWFyIDIwMTEgMTQ6NTk6MzUgKzAxMDAKU3ViamVjdDogW1BBVENIIDEvMl0g
TWVudGlvbiBzeW1ib2wgbmFtZSBpbiBub24tY29uc3RhbnQgLnNpemUgZXhwcmVzc2lvbi4KCmdh
cy8KCjIwMTEtMDMtMDUgIEguSi4gTHUgIDxob25naml1Lmx1QGludGVsLmNvbT4KCgkqIGNvbmZp
Zy9vYmotZWxmLmMgKGVsZl9mcm9iX3N5bWJvbCk6IE1lbnRpb24gc3ltYm9sIG5hbWUgaW4KCW5v
bi1jb25zdGFudCAuc2l6ZSBleHByZXNzaW9uLgoKZ2FzL3Rlc3RzdWl0ZS8KCjIwMTEtMDMtMDUg
IEguSi4gTHUgIDxob25naml1Lmx1QGludGVsLmNvbT4KCgkqIGdhcy9lbGYvYmFkLXNpemUuZXJy
OiBVcGRhdGVkLgoKQ29uZmxpY3RzOgoKCWdhcy9DaGFuZ2VMb2cKCWdhcy90ZXN0c3VpdGUvQ2hh
bmdlTG9nCglnYXMvdGVzdHN1aXRlL2dhcy9lbGYvYmFkLXNpemUuZXJyCgoyMDExLTAzLTA4ICBT
ZWRhdCBEaWxlayAgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KCgkqIENoZXJyeS1waWNrZWQgZnJv
bSBjb21taXQgYjk1MjFmYzBiZTc5NDVmYzg0MmNlMTE5N2UyNDFhMDIzMzc4MTI1ZAoJKiBEcm9w
IGNoYW5nZXMgaW4gZ2FzL0NoYW5nZUxvZyBhbmQgZ2FzL3Rlc3RzdWl0ZS9DaGFuZ2VMb2cKLS0t
CiBnYXMvY29uZmlnL29iai1lbGYuYyAgICAgICAgICAgICAgIHwgICA0OCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLQogZ2FzL3Rlc3RzdWl0ZS9nYXMvZWxmL2JhZC1zaXplLmVy
ciB8ICAgIDIgKwogMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGdhcy90ZXN0c3VpdGUvZ2FzL2VsZi9iYWQtc2l6ZS5l
cnIKCmRpZmYgLS1naXQgYS9nYXMvY29uZmlnL29iai1lbGYuYyBiL2dhcy9jb25maWcvb2JqLWVs
Zi5jCmluZGV4IDk2OWE1MDkuLmQ0MzQwOWEgMTAwNjQ0Ci0tLSBhL2dhcy9jb25maWcvb2JqLWVs
Zi5jCisrKyBiL2dhcy9jb25maWcvb2JqLWVsZi5jCkBAIC0xODc5LDYgKzE4NzksNyBAQCB2b2lk
CiBlbGZfZnJvYl9zeW1ib2wgKHN5bWJvbFMgKnN5bXAsIGludCAqcHVudHApCiB7CiAgIHN0cnVj
dCBlbGZfb2JqX3N5ICpzeV9vYmo7CisgIGV4cHJlc3Npb25TICpzaXplOwogCiAjaWZkZWYgTkVF
RF9FQ09GRl9ERUJVRwogICBpZiAoRUNPRkZfREVCVUdHSU5HKQpAQCAtMTg4NywxMyArMTg4OCw1
MCBAQCBlbGZfZnJvYl9zeW1ib2wgKHN5bWJvbFMgKnN5bXAsIGludCAqcHVudHApCiAKICAgc3lf
b2JqID0gc3ltYm9sX2dldF9vYmogKHN5bXApOwogCi0gIGlmIChzeV9vYmotPnNpemUgIT0gTlVM
TCkKKyAgc2l6ZSA9IHN5X29iai0+c2l6ZTsKKyAgaWYgKHNpemUgIT0gTlVMTCkKICAgICB7Ci0g
ICAgICBpZiAocmVzb2x2ZV9leHByZXNzaW9uIChzeV9vYmotPnNpemUpCi0JICAmJiBzeV9vYmot
PnNpemUtPlhfb3AgPT0gT19jb25zdGFudCkKLQlTX1NFVF9TSVpFIChzeW1wLCBzeV9vYmotPnNp
emUtPlhfYWRkX251bWJlcik7CisgICAgICBpZiAocmVzb2x2ZV9leHByZXNzaW9uIChzaXplKQor
CSAgJiYgc2l6ZS0+WF9vcCA9PSBPX2NvbnN0YW50KQorCVNfU0VUX1NJWkUgKHN5bXAsIHNpemUt
PlhfYWRkX251bWJlcik7CiAgICAgICBlbHNlCi0JYXNfYmFkIChfKCIuc2l6ZSBleHByZXNzaW9u
IGRvZXMgbm90IGV2YWx1YXRlIHRvIGEgY29uc3RhbnQiKSk7CisJeworCSAgY29uc3QgY2hhciAq
b3BfbmFtZSA9IE5VTEw7CisJICBjb25zdCBjaGFyICphZGRfbmFtZSA9IE5VTEw7CisKKwkgIGlm
IChzaXplLT5YX29wID09IE9fc3VidHJhY3QpCisJICAgIHsKKwkgICAgICBvcF9uYW1lID0gU19H
RVRfTkFNRSAoc2l6ZS0+WF9vcF9zeW1ib2wpOworCSAgICAgIGFkZF9uYW1lID0gU19HRVRfTkFN
RSAoc2l6ZS0+WF9hZGRfc3ltYm9sKTsKKwkgICAgICBpZiAoc3RyY21wIChvcF9uYW1lLCBGQUtF
X0xBQkVMX05BTUUpID09IDApCisJCW9wX25hbWUgPSBOVUxMOworCSAgICAgIGlmIChzdHJjbXAg
KGFkZF9uYW1lLCBGQUtFX0xBQkVMX05BTUUpID09IDApCisJCWFkZF9uYW1lID0gTlVMTDsKKwor
CSAgICAgIGlmIChvcF9uYW1lICYmIGFkZF9uYW1lKQorCQlhc19iYWQgKF8oIi5zaXplIGV4cHJl
c3Npb24gd2l0aCBzeW1ib2xzIGAlcycgYW5kIGAlcycgIgorCQkJICAiZG9lcyBub3QgZXZhbHVh
dGUgdG8gYSBjb25zdGFudCIpLAorCQkJb3BfbmFtZSwgYWRkX25hbWUpOworCSAgICAgIGVsc2UK
KwkJeworCQkgIGNvbnN0IGNoYXIgKm5hbWU7CisKKwkJICBpZiAob3BfbmFtZSkKKwkJICAgIG5h
bWUgPSBvcF9uYW1lOworCQkgIGVsc2UgaWYgKGFkZF9uYW1lKQorCQkgICAgbmFtZSA9IGFkZF9u
YW1lOworCQkgIGVsc2UKKwkJICAgIG5hbWUgPSBOVUxMOworCisJCSAgaWYgKG5hbWUpCisJCSAg
ICBhc19iYWQgKF8oIi5zaXplIGV4cHJlc3Npb24gd2l0aCBzeW1ib2wgYCVzJyAiCisJCQkgICAg
ICAiZG9lcyBub3QgZXZhbHVhdGUgdG8gYSBjb25zdGFudCIpLCBuYW1lKTsKKwkJfQorCSAgICB9
CisJICAKKwkgIGlmICghb3BfbmFtZSAmJiAhYWRkX25hbWUpCisJICAgIGFzX2JhZCAoXygiLnNp
emUgZXhwcmVzc2lvbiBkb2VzIG5vdCBldmFsdWF0ZSB0byBhIGNvbnN0YW50IikpOworCX0KICAg
ICAgIGZyZWUgKHN5X29iai0+c2l6ZSk7CiAgICAgICBzeV9vYmotPnNpemUgPSBOVUxMOwogICAg
IH0KZGlmZiAtLWdpdCBhL2dhcy90ZXN0c3VpdGUvZ2FzL2VsZi9iYWQtc2l6ZS5lcnIgYi9nYXMv
dGVzdHN1aXRlL2dhcy9lbGYvYmFkLXNpemUuZXJyCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAuLmE1YmZjMzEKLS0tIC9kZXYvbnVsbAorKysgYi9nYXMvdGVzdHN1aXRlL2dhcy9l
bGYvYmFkLXNpemUuZXJyCkBAIC0wLDAgKzEsMiBAQAorLipiYWQtc2l6ZVwuczogQXNzZW1ibGVy
IG1lc3NhZ2VzOgorLipiYWQtc2l6ZVwuczo2OiBFcnJvcjouKmBfdGVzdF9ub3AnLioKLS0gCjEu
Ny40LjEKCg==
--0016361e82e44cc10f049e0b62d7
Content-Type: text/plain; charset=US-ASCII;
	name="0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch"
Content-Disposition: attachment;
	filename="0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gl26k8a71

RnJvbSBlZmY1MzE1MjEzZTVhZDRjZjI1NWUzZWM1MzZmNjI5YTAxNTEwMGVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDggTWFyIDIwMTEgMTU6MDU6NDUgKzAxMDAKU3ViamVjdDogW1BBVENIIDIvMl0g
UmV2ZXJ0IHRoZSBsYXN0IGNoYW5nZSBvbiBnYXMvZWxmL2JhZC1zaXplLmVyci4KCjIwMTEtMDMt
MDYgIEguSi4gTHUgIDxob25naml1Lmx1QGludGVsLmNvbT4KCgkqIGdhcy9lbGYvYmFkLXNpemUu
ZXJyOiBSZXZlcnQgdGhlIGxhc3QgY2hhbmdlLgoKQ29uZmxpY3RzOgoKCWdhcy90ZXN0c3VpdGUv
Q2hhbmdlTG9nCgoyMDExLTAzLTA4ICBTZWRhdCBEaWxlayAgPHNlZGF0LmRpbGVrQGdtYWlsLmNv
bT4KCgkqIENoZXJyeS1waWNrZWQgZnJvbSBjb21taXQgY2JkMTQxYmI2OWY3OTFkZTdlYTE1ODFh
YmU3YWZiMzRmMGM2MTI4OAoJKiBEcm9wIGNoYW5nZXMgaW4gZ2FzL3Rlc3RzdWl0ZS9DaGFuZ2VM
b2cKLS0tCiBnYXMvdGVzdHN1aXRlL2dhcy9lbGYvYmFkLXNpemUuZXJyIHwgICAgMiArLQogMSBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZ2FzL3Rlc3RzdWl0ZS9nYXMvZWxmL2JhZC1zaXplLmVyciBiL2dhcy90ZXN0c3VpdGUvZ2Fz
L2VsZi9iYWQtc2l6ZS5lcnIKaW5kZXggYTViZmMzMS4uNWUwMWVmMiAxMDA2NDQKLS0tIGEvZ2Fz
L3Rlc3RzdWl0ZS9nYXMvZWxmL2JhZC1zaXplLmVycgorKysgYi9nYXMvdGVzdHN1aXRlL2dhcy9l
bGYvYmFkLXNpemUuZXJyCkBAIC0xLDIgKzEsMiBAQAogLipiYWQtc2l6ZVwuczogQXNzZW1ibGVy
IG1lc3NhZ2VzOgotLipiYWQtc2l6ZVwuczo2OiBFcnJvcjouKmBfdGVzdF9ub3AnLioKKy4qYmFk
LXNpemVcLnM6NjogRXJyb3I6IC4qCi0tIAoxLjcuNC4xCgo=
--0016361e82e44cc10f049e0b62d7--
