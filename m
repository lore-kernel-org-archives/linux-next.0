From: Juergen Gross <jgross@suse.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with
	the tip tree
Date: Mon, 3 Apr 2017 16:55:59 +0200
Message-ID: <03587cc8-67db-e6be-468a-54072a5db5fa@suse.com>
References: <20170329143528.50c0f325@canb.auug.org.au>
 <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
 <20170329085945.GA11382@gmail.com>
 <26fb88f9-dd20-c56b-e87d-6d454b4f7c71@suse.com>
 <20170403143825.GA1124@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xen.org>
In-Reply-To: <20170403143825.GA1124@gmail.com>
List-Unsubscribe: <https://lists.xen.org/cgi-bin/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xen.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xen.org>
List-Help: <mailto:xen-devel-request@lists.xen.org?subject=help>
List-Subscribe: <https://lists.xen.org/cgi-bin/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xen.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xen.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xen.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Garnier <thgarnie@google.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

T24gMDMvMDQvMTcgMTY6MzgsIEluZ28gTW9sbmFyIHdyb3RlOgo+IAo+ICogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAKPj4+IFNvIG15IHN1Z2dlc3Rpb24gd291bGQg
YmU6IGNvdWxkIHlvdSBkZWxheSA3NWNkMzJkNjA5M2UgZm9yIGEgd2VlaywgYW5kIHRoZW4gCj4+
PiBtZXJnZSBpdCBvbiB0b3Agb2YgYSBwdWxsZWQgaW4gdGlwOng4Ni9tbT8gSSdsbCBzZW5kIHRo
YXQgdHJlZSB0byBMaW51cyBvbiB0aGUgCj4+PiBmaXJzdCBkYXkgb2YgdGhlIG1lcmdlIHdpbmRv
dyBzbyB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IG9yZGVyaW5nIHByb2JsZW1zLgo+Pgo+PiBPa2F5
LCB0aGF0J3MgcmF0aGVyIGVhc3kgdG8gZG8uCj4+Cj4+IEJvcmlzLCBJIHJlbmFtZWQgdGhlIGN1
cnJlbnQgWGVuIGZvci1saW51cy00LjEyIGJyYW5jaCBmb3IgZWFzeSBkZXZlbG9wbWVudCBvZiAK
Pj4gb3RoZXIgWGVuIHBhdGNoZXMgdG8gZm9yLWxpbnVzLTQuMTItcHJlLgo+Pgo+PiBJJ2xsIGNy
ZWF0ZSBhbm90aGVyIGJyYW5jaCBmb3ItbGludXMtNC4xMiBiYXNlZCBvbiB0aGUgdGlwIHRyZWUg
bmV4dCB3ZWVrIHdoaWNoIAo+PiB3aWxsIGJlIHN1YmplY3QgdG8gdGhlIHB1bGwgcmVxdWVzdCBm
b3IgTGludXMuIEFzIHNvb24gYXMgZm9yLWxpbnVzLTQuMTIgaXMgCj4+IHJlYWR5IHRoZSBmb3It
bGludXMtNC4xMi1wcmUgYnJhbmNoIHNob3VsZG4ndCBiZSB1c2VkIGFueSBsb25nZXIuCj4gCj4g
SSd2ZSBjcmVhdGVkIGEgdGlwOng4Ni1tbS1mb3IteGVuIGJyYW5jaCB3aXRoIHRoZSBmb2xsb3dp
bmcgaGVhZDoKPiAKPiAgIDdmNzU1NDBmZjJjYSAoIk1lcmdlIHRhZyAndjQuMTEtcmM1JyBpbnRv
IHg4Ni9tbSwgdG8gcmVmcmVzaCB0aGUgYnJhbmNoIikKPiAKPiAuLi4gd2hpY2ggc2hvdWxkIGJl
IGEgcmVhc29uYWJsZSBiYXNlIHRoYXQgaW5jbHVkZXMgYSB3b3JraW5nIHZlcnNpb24gb2YgdGhl
IAo+IDUtbGV2ZWwgcGFnZXRhYmxlIGNoYW5nZXMuCgpUaGFua3MsCgoKSnVlcmdlbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbi5vcmcKaHR0cHM6Ly9saXN0cy54ZW4ub3JnL3hl
bi1kZXZlbAo=
