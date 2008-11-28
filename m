From: Nico -telmich- Schottelius <nico-linux-ipw3945-devel@schottelius.org>
Subject: next-20081125: call trace for iwlagn (rfkill switch
	on)
Date: Fri, 28 Nov 2008 07:38:59 +0100
Message-ID: <20081128063859.GB4700@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6896453955143613423=="
Return-path: <ipw3945-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ipw3945-devel>,
	<mailto:ipw3945-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ipw3945-devel>
List-Post: <mailto:ipw3945-devel@lists.sourceforge.net>
List-Help: <mailto:ipw3945-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ipw3945-devel>,
	<mailto:ipw3945-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: ipw3945-devel-bounces@lists.sourceforge.net
To: ipw3945-devel@lists.sourceforge.net
Cc: linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--===============6896453955143613423==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

After a fresh reboot and enabled rfkill switch (-> radio turned off!),
I get the following call trace:

[   89.169572] iwlagn 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ=
 17
[   89.169791] iwlagn 0000:03:00.0: restoring config space at offset 0x1 (w=
as 0x100102, writing 0x100106)
[   89.169898] iwlagn 0000:03:00.0: irq 314 for MSI/MSI-X
[   89.169980] iwlagn 0000:03:00.0: firmware: requesting iwlwifi-5000-1.uco=
de
[   89.370030] iwlagn: Radio disabled by HW RF Kill switch
[   89.381023] ------------[ cut here ]------------
[   89.381215] WARNING: at net/mac80211/main.c:227 ieee80211_hw_config+0x71=
/0x79 [mac80211]()
[   89.381455] Modules linked in: rfcomm l2cap bluetooth uinput autofs4 ipv=
6 cpufreq_powersave md_mod loop sha256_generic ansi_cprng krng chainiv rng =
aes_x86_64 aes_generic cbc dm_crypt dm_mod arc4 ecb cryptomgr aead crypto_b=
lkcipher crypto_hash snd_hda_intel snd_pcm snd_page_alloc iwlagn snd_hwdep =
iwlcore thinkpad_acpi snd_seq snd_timer snd_seq_device rfkill snd hwmon mac=
80211 video wmi rtc_cmos rtc_core i2c_i801 backlight led_class e1000e outpu=
t soundcore rtc_lib intel_agp uhci_hcd ehci_hcd i2c_core cfg80211 nvram usb=
core pcspkr
[   89.384858] Pid: 3923, comm: NetworkManager Not tainted 2.6.28-rc6-next-=
20081125-denkbrett #15
[   89.385074] Call Trace:
[   89.385229]  [<ffffffff80232991>] warn_on_slowpath+0x51/0x75
[   89.385367]  [<ffffffff8043ac40>] qdisc_create_dflt+0x34/0x4a
[   89.385514]  [<ffffffffa015128b>] iwl_mac_config+0x219/0x237 [iwlagn]
[   89.385667]  [<ffffffffa00ca76e>] ieee80211_hw_config+0x71/0x79 [mac8021=
1]
[   89.385823]  [<ffffffffa00d5925>] ieee80211_open+0x5b5/0x6d1 [mac80211]
[   89.385962]  [<ffffffff80442d71>] __nla_reserve+0x1e/0x46
[   89.386097]  [<ffffffff8042ba85>] dev_open+0x75/0xb2
[   89.386230]  [<ffffffff8042b451>] dev_change_flags+0xaf/0x16d
[   89.386365]  [<ffffffff80432c67>] do_setlink+0x2c4/0x391
[   89.386500]  [<ffffffff80433ba2>] rtnetlink_rcv_msg+0x0/0x1eb
[   89.386634]  [<ffffffff80432eca>] rtnl_setlink+0x10b/0x10d
[   89.386769]  [<ffffffff80433ba2>] rtnetlink_rcv_msg+0x0/0x1eb
[   89.386904]  [<ffffffff80442bd0>] netlink_rcv_skb+0x34/0x7c
[   89.387038]  [<ffffffff80433b9c>] rtnetlink_rcv+0x1f/0x25
[   89.387173]  [<ffffffff804426bc>] netlink_unicast+0x203/0x274
[   89.387308]  [<ffffffff804254f0>] __alloc_skb+0x61/0x123
[   89.387445]  [<ffffffff804429a9>] netlink_sendmsg+0x27c/0x28f
[   89.387600]  [<ffffffff80484616>] unix_stream_recvmsg+0x4ef/0x605
[   89.387737]  [<ffffffff8041eb2f>] sock_sendmsg+0xe2/0xff
[   89.387873]  [<ffffffff80244e00>] autoremove_wake_function+0x0/0x2e
[   89.388038]  [<ffffffff8041dc54>] move_addr_to_kernel+0x25/0x36
[   89.388174]  [<ffffffff8041ed63>] sys_sendmsg+0x217/0x28a
[   89.388308]  [<ffffffff80228fbf>] __wake_up+0x30/0x44
[   89.388442]  [<ffffffff80441a50>] netlink_insert+0xfe/0x121
[   89.388577]  [<ffffffff8041f759>] move_addr_to_user+0x41/0x58
[   89.388712]  [<ffffffff8041fc15>] sys_getsockname+0x7a/0xaa
[   89.388847]  [<ffffffff8020b53b>] system_call_fastpath+0x16/0x1b
[   89.388981] ---[ end trace de9da4130e9bcfbf ]---
[   89.390488] ADDRCONF(NETDEV_UP): wlan0: link is not ready

Any fixes available?

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkvkgMACgkQuL75KpiFGIw2jwCdF7WhNk/2rifs+oSZjnSKF0zQ
qboAoMHKBYLR7q+/HZNpNOpwAeqphb/x
=JnaZ
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--


--===============6896453955143613423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-------------------------------------------------------------------------
This SF.Net email is sponsored by the Moblin Your Move Developer's challenge
Build the coolest Linux based applications with Moblin SDK & win great prizes
Grand prize is a trip for two to an Open Source event anywhere in the world
http://moblin-contest.org/redirect.php?banner_id=100&url=/
--===============6896453955143613423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Ipw3945-devel mailing list
Ipw3945-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/ipw3945-devel

--===============6896453955143613423==--
