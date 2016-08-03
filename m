From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Wed, 3 Aug 2016 22:19:11 +1000
Message-ID: <20160803221911.2f76ccad@canb.auug.org.au>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
 <20160802220243.GK3296@wotan.suse.de>
 <20160803102324.6372e66a@canb.auug.org.au>
 <1944325.MtNrGQyQle@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1944325.MtNrGQyQle@wuerfel>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

SGkgQXJuZCwKCk9uIFdlZCwgMDMgQXVnIDIwMTYgMDk6NTI6MjMgKzAyMDAgQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBVc2luZyBhIGRpZmZlcmVudCB3YXkgdG8gbGlu
ayB0aGUga2VybmVsIHdvdWxkIGFsc28gaGVscCB1cyB3aXRoCj4gdGhlIHJlbWFpbmluZyBhbGx5
ZXNjb25maWcgcHJvYmxlbSBvbiBBUk0sIGFzIHRoZSBwcm9ibGVtIGlzIG9ubHkgaW4KPiAnbGQg
LXInIG5vdCBwcm9kdWNpbmcgdHJhbXBvbGluZXMgZm9yIHN5bWJvbHMgdGhhdCBsYXRlciBjYW5u
b3QgZ2V0Cj4gdGhlbSBhbnkgbW9yZS4gSXQgd291bGQgcHJvYmFibHkgYWxzbyBoZWxwIGJ1aWxk
aW5nIHdpdGggbGQuZ29sZCwKPiB3aGljaCBpcyBjdXJyZW50bHkgbm90IHdvcmtpbmcuCj4gCj4g
V2hhdCBpcyB5b3VyIHN1Z2dlc3RlZCBhbHRlcm5hdGl2ZT8KCkkgaGF2ZSBhIHBhdGNoIHRoYXQg
bWFrZSB0aGUgYnVpbHQtaW4ubyBmaWxlcyBpbnRvIHRoaW4gYXJjaGl2ZXMgKHNhbWUKYXMgYXJj
aGl2ZXMsIGJ1dCB0aGUgYWN0dWFsIG9iamVjdHMgYXJlIHJlcGxhY2VkIHdpdGggdGhlIG5hbWUg
b2YgdGhlCm9yaWdpbmFsIG9iamVjdCBmaWxlKS4gIFRoYXQgd2F5IHRoZSBmaW5hbCBsaW5rIGhh
cyBhbGwgdGhlIG9yaWdpbmFsCm9iamVjdHMuICBJIGhhdmVuJ3QgY2hlY2tlZCB0byBzZWUgd2hh
dCB0aGUgb3ZlcmhlYWRzIG9mIGRvaW5nIGl0IHRoaXMKd2F5IGlzLgoKTmljayBQaWdnaW4gaGFz
IGp1c3QgdG9kYXkgdGFrZW4gbXkgb2xkIHBhdGNoIChpdCB3YXMgbGFzdCByZWJhc2VkIHRvCnY0
LjQtcmMxKSBhbmQgdHJpZWQgaXQgb24gYSByZWNlbnQga2VybmVsIGFuZCBpdCBzdGlsbCBzZWVt
cyB0byBtb3N0bHkKd29yay4gIEl0IHByb2JhYmx5IG5lZWRzIHNvbWUgdGlkeWluZyB1cCwgYnV0
IHlvdSBhcmUgd2VsY29tZSB0byB0ZXN0Cml0IGlmIHlvdSB3YW50IHRvLgoKLS0gCkNoZWVycywK
U3RlcGhlbiBSb3Rod2VsbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGluZyBsaXN0CkxpbnV4cHBjLWRldkBsaXN0cy5vemxh
YnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9saW51eHBwYy1kZXY=
