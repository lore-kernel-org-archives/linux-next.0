From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Tue, 8 Mar 2011 16:42:13 +0100
Message-ID: <AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
	<AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com>
	<AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=00163649a965c9a532049dfa74cd
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H.J. Lu" <hjl.tools@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Matthias Klose <doko@debian.org>, linux-next <linux-next@vger.kernel.org>, debian-gcc <debian-gcc@lists.debian.org>, binutils <binutils@sourceware.org>, psomas@cslab.ece.ntua.gr, JBeulich@novell.com, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--00163649a965c9a532049dfa74cd
Content-Type: text/plain; charset=UTF-8

On 3/8/11, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
> On 3/8/11, H.J. Lu <hjl.tools@gmail.com> wrote:
>> On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek@googlemail.com>
>> wrote:
>>> Hi,
>>>
>>> my build of linux-next (next-20110308, the same with the one from
>>> yesterday) is broken.
>>> (I translated the German output.)
>>>
>>> [ build.log ]
>>>  AS      arch/x86/kernel/entry_32.o
>>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:
>>> Assembler messages:
>>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:1421:
>>> Error: .size expression does not evaluate to a constant
>>> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error 1)
>>> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
>>> make[4]: *** [arch/x86] Fehler 2 (Error 2)
>>> make[4]: *** Warte auf noch nicht beendete Prozesse... (Waiting for
>>> unfinished jobs...)
>>>
>>
>> This is a kernel bug.  Please use the latest binutils from CVS.
>> It will tell you which symbol causes this.
>>
>>
>> --
>> H.J.
>>
>
> Yeah, I have cherry-picked these two upstream commits before you have
> mentionned it...
>
> 0001-Mention-symbol-name-in-non-constant-.size-expression.patch
>        (Cherry-picked from commit b9521fc0be7945fc842ce1197e241a023378125d)
> 0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch
>        (Cherry-picked from commit cbd141bb69f791de7ea1581abe7afb34f0c61288)
>
> ... and have built with them a new binutils Debian package.
>
> The error looks now like this (sorry for the German output):
> ...
>   AS      arch/x86/kernel/entry_32.o
> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:
> Assembler messages:
> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:1421:
> Error: .size expression with symbol `apf_page_fault' does not evaluate
> to a constant
> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1
> make[5]: *** [arch/x86/kernel] Fehler 2
> make[5]: *** Warte auf noch nicht beendete Prozesse...
>
> Anyway, before more riddling around it would be very helpful to have a
> clear pointer if there is a fix around... That building, testing and
> installing took me now several hours.
> And... yeah, backports to 2.21-branch appreciated.
>
> - Sedat -
>

After a quick look into the source, it seems attached patch fixes the issue.
Is that OK?

- Sedat -

--00163649a965c9a532049dfa74cd
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-x86-Fix-build-failure-with-binutils-as-from-upstream.patch"
Content-Disposition: attachment;
	filename="0001-x86-Fix-build-failure-with-binutils-as-from-upstream.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSBjNGY4MDcwODA1ZmZmN2MwZDA5N2I3YTBmYjRmNTQ5ZWJkMTRhNzRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDggTWFyIDIwMTEgMTY6MzI6MTggKzAxMDAKU3ViamVjdDogW1BBVENIXSB4ODY6
IEZpeCBidWlsZCBmYWlsdXJlIHdpdGggYmludXRpbHMvYXMgZnJvbSB1cHN0cmVhbQoKVGhpcyBp
cyBmcm9tIG15IGJ1aWxkIGxvZzoKWy4uLl0KQVMgICAgICBhcmNoL3g4Ni9rZXJuZWwvZW50cnlf
MzIubwphcmNoL3g4Ni9rZXJuZWwvZW50cnlfMzIuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgphcmNo
L3g4Ni9rZXJuZWwvZW50cnlfMzIuUzoxNDIxOiBFcnJvcjogLnNpemUgZXhwcmVzc2lvbiB3aXRo
IHN5bWJvbCBgYXBmX3BhZ2VfZmF1bHQnIGRvZXMgbm90IGV2YWx1YXRlIHRvIGEgY29uc3RhbnQK
ClNpZ25lZC1vZmYtYnk6IFNlZGF0IERpbGVrIDxzZWRhdC5kaWxla0BnbWFpbC5jb20+Ci0tLQog
YXJjaC94ODYva2VybmVsL2VudHJ5XzMyLlMgfCAgICAyICstCiAxIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJu
ZWwvZW50cnlfMzIuUyBiL2FyY2gveDg2L2tlcm5lbC9lbnRyeV8zMi5TCmluZGV4IGM4YjRlZmEu
LjljYTNiMGUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9lbnRyeV8zMi5TCisrKyBiL2Fy
Y2gveDg2L2tlcm5lbC9lbnRyeV8zMi5TCkBAIC0xNDEzLDcgKzE0MTMsNyBAQCBFTlRSWShhc3lu
Y19wYWdlX2ZhdWx0KQogCUNGSV9BREpVU1RfQ0ZBX09GRlNFVCA0CiAJam1wIGVycm9yX2NvZGUK
IAlDRklfRU5EUFJPQwotRU5EKGFwZl9wYWdlX2ZhdWx0KQorRU5EKGFzeW5jX3BhZ2VfZmF1bHQp
CiAjZW5kaWYKIAogLyoKLS0gCjEuNy40LjEKCg==
--00163649a965c9a532049dfa74cd--
