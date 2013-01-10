From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ia64 tree
Date: Fri, 11 Jan 2013 10:54:40 +1100
Message-ID: <20130111105440.3497d6f8c79189ff6a1bd236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__11_Jan_2013_10_54_40_+1100_aZgpohlBVb/fudIn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luck, Tony" <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seiji Aguchi <seiji.aguchi@hds.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__11_Jan_2013_10_54_40_+1100_aZgpohlBVb/fudIn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ia64 tree, today's linux-next build (x86_64_allmodconfig)
failed like this:

ERROR: "pstore_cannot_block_path" [drivers/firmware/efivars.ko] undefined!

Caused by commit 1a1df768ea4e ("efi_pstore: Avoid deadlock in
non-blocking paths").

I have used the ia64 tree from next-20130110 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__11_Jan_2013_10_54_40_+1100_aZgpohlBVb/fudIn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQ71TAAAoJEECxmPOUX5FEqRQP/3i2fZaEIuYiHR4zpA1pZCUM
75rfYTT36WF9m9h3wTZEXp1DfiDt02a8T316vcPND1wUby5CU8LQV0oISU5urbLX
leSSKBT2N23D69swEYSPs9kQ6aM/if57qvh5Wg2KgRS3hHmGjmqpFH9YZ/EOLd2V
9TtYYZ+3cvwtasqSbgxFhNDHp7c2a60mqTFRWUwakkH6uinygVUab095hVGGpdWn
3m3eb9KoTPeGVgBeYbwKrLxfbRLYifF7y1WhS+gYjHQ8HEZlh0TBIjd1nQTdJNMZ
DgjPOSKcyANkhE/CkmsuTyEO1qO3/T/FY2qm35TotnPoeDplJRkUNua0kq8ZDXp6
nsiy4oiQA0/o+czuygff/t7W9EbBNupZ2hOC4+t/U0nzoJMt1/bopaZ6dcxP0Lla
3Ku7etUqqvzB0jGoCh4lpcEPDS0xavsL3sajLjkYyNTimVdMqI5vkDf5NWSngWH/
9XbZhGRjfUc3gv4pjTBWInYmFBc8OfpOy/PukCTSZ6KO8q1OSteHpT/uyEcxtbyW
/qIhEyLFnevscYNja/PWuR+hZZ85e/afS+YLdVQ2ljnAxNV4LOt2yTY2uPB2ZkLQ
Gev/UPfLEvCNkermKBpiBP0bJVykVRBFBegh4F/ABvd5J6R/dAeIz5cOQLT3NSeb
Allcmm2SE7IjkPqDzUlt
=3q3a
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jan_2013_10_54_40_+1100_aZgpohlBVb/fudIn--
